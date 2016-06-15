The lifecycle of a stream is shown in Figure 2.
图2显示了流的生命周期。

                             +--------+
                     send PP |        | recv PP
                    ,--------|  idle  |--------.
                   /         |        |         \
                  v          +--------+          v
           +----------+          |           +----------+
           |          |          | send H /  |          |
    ,------| reserved |          | recv H    | reserved |------.
    |      | (local)  |          |           | (remote) |      |
    |      +----------+          v           +----------+      |
    |          |             +--------+             |          |
    |          |     recv ES |        | send ES     |          |
    |   send H |     ,-------|  open  |-------.     | recv H   |
    |          |    /        |        |        \    |          |
    |          v   v         +--------+         v   v          |
    |      +----------+          |           +----------+      |
    |      |   half   |          |           |   half   |      |
    |      |  closed  |          | send R /  |  closed  |      |
    |      | (remote) |          | recv R    | (local)  |      |
    |      +----------+          |           +----------+      |
    |           |                |                 |           |
    |           | send ES /      |       recv ES / |           |
    |           | send R /       v        send R / |           |
    |           | recv R     +--------+   recv R   |           |
    | send R /  `----------->|        |<-----------'  send R / |
    | recv R                 | closed |               recv R   |
    `----------------------->|        |<----------------------'
                             +--------+

       send:   endpoint sends this frame
       recv:   endpoint receives this frame

       H:  HEADERS frame (with implied CONTINUATIONs)
       PP: PUSH_PROMISE frame (with implied CONTINUATIONs)
       ES: END_STREAM flag
       R:  RST_STREAM frame

          
Figure 2: Stream States

Note that this diagram shows stream state transitions and the frames and flags that affect those transitions only. In this regard, CONTINUATION frames do not result in state transitions; they are effectively part of the HEADERS or PUSH_PROMISE that they follow. For the purpose of state transitions, the END_STREAM flag is processed as a separate event to the frame that bears it; a HEADERS frame with the END_STREAM flag set can cause two state transitions.

上面的图显示了流的状态转换以及导致状态转换的帧和标记。虽然CONTINUATION帧并不会引起流的状态转换，单它是他所紧随的HEADERS帧或PUSH_PROMISE帧的有效的组成部分。为了便于描述状态转移，END_STREAM的标识在处理的时候特意和承载它的帧区分开；所以一个带有END_STREAM标识的HEADERS帧会导致两个状态转移。

Both endpoints have a subjective view of the state of a stream that could be different when frames are in transit. Endpoints do not coordinate the creation of streams; they are created unilaterally by either endpoint. The negative consequences of a mismatch in states are limited to the "closed" state after sending RST_STREAM, where frames might be received for some time after closing.

两个端点都对流的状态有一个主观的视图，这个视图在帧真在传输的时候可能会不一样。在创建流的的时候端点之间不需要相互协调，任何一个端点都可以单方面的创建流。状态不匹配的负面后果仅限于发送RST_STREAM之后的关闭状态，有时候可能会在关闭之后收到帧。

Streams have the following states:

流具有以下状态：

**idle:**

All streams start in the "idle" state. 

The following transitions are valid from this state:

+	Sending or receiving a HEADERS frame causes the stream to become "open". The stream identifier is selected as described in Section 5.1.1. The same HEADERS frame can also cause a stream to immediately become "half-closed".
+	Sending a PUSH_PROMISE frame on another stream reserves the idle stream that is identified for later use. The stream state for the reserved stream transitions to "reserved (local)".
+	Receiving a PUSH_PROMISE frame on another stream reserves an idle stream that is identified for later use. The stream state for the reserved stream transitions to "reserved (remote)".
+	Note that the PUSH_PROMISE frame is not sent on the idle stream but references the newly reserved stream in the Promised Stream ID field.

Receiving any frame other than HEADERS or PRIORITY on a stream in this state MUST be treated as a connection error (Section 5.4.1) of type PROTOCOL_ERROR.

**空闲：**

所有的流都是以空闲状态开始的。

空闲状态下，以下的状态转换是合法的：

+   发送或者接受到HEADERS帧之后流状态变为打开。流标识的选择在5.1.1节中描述。相同的HEADERS帧也可以导致流状态变为半关闭状态。
+   在另一个流发送一个PUSH_PROMISE帧将保留这个空闲流供后续使用。这个流的状态转换为“本地预留”。
+   在另一个流收到一个PUSH_PROMISE帧将保留这个空闲流供后续使用。这个流的状态转换为“远程预留”。
+   注意PUSH_PROMISE不是从空闲流发送的，只是在承诺流ID字段中引用了新的预留的流。

在空闲状态下的流收到任何除HEADERS帧或者PRIORITY帧以外帧都必须处理为协议错误类型的连接错误。

**reserved (local):**

A stream in the "reserved (local)" state is one that has been promised by sending a PUSH_PROMISE frame. A PUSH_PROMISE frame reserves an idle stream by associating the stream with an open stream that was initiated by the remote peer (see Section 8.2). 半关闭（“”）”

In this state, only the following transitions are possible:

+	The endpoint can send a HEADERS frame. This causes the stream to open in a "half-closed (remote)" state.”。“”
+	Either endpoint can send a RST_STREAM frame to cause the stream to become "closed". This releases the stream reservation.


An endpoint MUST NOT send any type of frame other than HEADERS, RST_STREAM, or PRIORITY in this state. 

A PRIORITY or WINDOW_UPDATE frame MAY be received in this state. Receiving any type of frame other than RST_STREAM, PRIORITY, or WINDOW_UPDATE on a stream in this state MUST be treated as a connection error (Section 5.4.1) of type PROTOCOL_ERROR.

**本地预留**

一个本地预留状态表示因为发送了一个PUSH_PROMISE帧而被承诺的流状态。PUSH_PROMISE帧通过将空闲流和一个已经被远端初始化的打开的流关联起来实现预留这个空闲流。

在这个状态下，只会发生以下状态转换：

+   端点发送一个HEADERS帧，导致流变成“远程半关闭”状态。
+   任何一端可以发送RST_STREAM帧使得流变为“关闭”状态。这将会释放流的预留。

端点在这个状态下只能发送HEADERS帧、RST_STREAM帧和PRIORITY帧。

这个状态下可以接受PRIORITY、WINDOW_UPDATE和RST_STREAM帧。接收到任何其他帧都应该视为一个协议错误类型的连接错误。

**reserved (remote):**

A stream in the "reserved (remote)" state has been reserved by a remote peer. 

In this state, only the following transitions are possible:

+	Receiving a HEADERS frame causes the stream to transition to "half-closed (local)".
+	Either endpoint can send a RST_STREAM frame to cause the stream to become "closed". This releases the stream reservation.


An endpoint MAY send a PRIORITY frame in this state to reprioritize the reserved stream. An endpoint MUST NOT send any type of frame other than RST_STREAM, WINDOW_UPDATE, or PRIORITY in this state. 

Receiving any type of frame other than HEADERS, RST_STREAM, or PRIORITY on a stream in this state MUST be treated as a connection error (Section 5.4.1) of type PROTOCOL_ERROR.

**远程预留**

一个远程预留状态表示被远程预留了。

在这个状态下，只会发生以下状态转换：

+   收到一个HEADERS镇，流状态变成“本地半关闭”状态。
+   任何一端可以发送RST_STREAM帧使得流变为“关闭”状态。这将会释放流的预留。

这个状态下端点可以发送一个PRIORITY帧来重置预留流的优先级。端点在这个状态下只能发送WINDOW_UPDATE帧、RST_STREAM帧和PRIORITY帧。

这个状态下可以接受PRIORITY、HEADERS和RST_STREAM帧。接收到任何其他帧都应该视为一个协议错误类型的连接错误。

**open:** 

A stream in the "open" state may be used by both peers to send frames of any type. In this state, sending peers observe advertised stream-level flow-control limits (Section 5.2). 

From this state, either endpoint can send a frame with an END_STREAM flag set, which causes the stream to transition into one of the "half-closed" states. An endpoint sending an END_STREAM flag causes the stream state to become "half-closed (local)"; an endpoint receiving an END_STREAM flag causes the stream state to become "half-closed (remote)". 

Either endpoint can send a RST_STREAM frame from this state, causing it to transition immediately to "closed".

**打开**

打开状态下的流可以发送任何帧。在这种状态下，发送端点监控流级别的流量控制限制广播。

任何端点都可以发送一个携带END_STREAM的帧，使得流状态变为某一种“半关闭”状态。发送END_STREAM的端流状态变为“本地半关闭状态”；接受端变为“远程半关闭”状态。

任何一端都可以发送RST_STREAM使得流变为“关闭”状态。


**half-closed (local):**

A stream that is in the "half-closed (local)" state cannot be used for sending frames other than WINDOW_UPDATE, PRIORITY, and RST_STREAM. 

A stream transitions from this state to "closed" when a frame that contains an END_STREAM flag is received or when either peer sends a RST_STREAM frame. 

An endpoint can receive any type of frame in this state. Providing flow-control credit using WINDOW_UPDATE frames is necessary to continue receiving flow-controlled frames. In this state, a receiver can ignore WINDOW_UPDATE frames, which might arrive for a short period after a frame bearing the END_STREAM flag is sent. 

PRIORITY frames received in this state are used to reprioritize streams that depend on the identified stream.

**本地半关闭**

处在“本地半关闭”状态的帧不能被用来发送除WINDOW_UPDATE, PRIORITY和RST_STREAM帧以外的帧。

当收到带有END_STREAM标识的帧或者任何一端发送RST_STREAM时，流状态变为“关闭”。

这个状态下端点可以收到任何类型的帧。为了继续收到流量控制帧，利用WINDOW_UPDATE帧提供流量控制授权是非常必要的。在这个状态下，WINDOW_UPDATE帧可能在携带有END_STREAM标识的帧发送之后短暂的时期内到达，而接收者可以忽略这些WINDOW_UPDATE帧。


**half-closed (remote):**

A stream that is "half-closed (remote)" is no longer being used by the peer to send frames. In this state, an endpoint is no longer obligated to maintain a receiver flow-control window. 

If an endpoint receives additional frames, other than WINDOW_UPDATE, PRIORITY, or RST_STREAM, for a stream that is in this state, it MUST respond with a stream error (Section 5.4.2) of type STREAM_CLOSED. 

A stream that is "half-closed (remote)" can be used by the endpoint to send frames of any type. In this state, the endpoint continues to observe advertised stream-level flow-control limits (Section 5.2). 

A stream can transition from this state to "closed" by sending a frame that contains an END_STREAM flag or when either peer sends a RST_STREAM frame.

**远程半关闭**

处在“远程半关闭”状态的流不能被对等端用来发送任何帧。在这个状态下，端点不在有义务对接受者流量控制窗口进行维护。

如果在这个状态下，端点收到WINDOW_UPDATE, PRIORITY, 和RST_STREAM帧以外的帧，它必须回复流关闭类型的流错误。

“远程半关闭”的流可以被端点用来发送任何帧。端点继续监控流级别的流量控制限制的广播。

可以通过发送含有END_STREAM标识的帧或者RST_STREAM帧使得流变成“关闭”状态。


**closed:**

The "closed" state is the terminal state. 

**关闭**

关闭状态是最终状态。

An endpoint MUST NOT send frames other than PRIORITY on a closed stream. An endpoint that receives any frame other than PRIORITY after receiving a RST_STREAM MUST treat that as a stream error (Section 5.4.2) of type STREAM_CLOSED. Similarly, an endpoint that receives any frames after receiving a frame with the END_STREAM flag set MUST treat that as a connection error (Section 5.4.1) of type STREAM_CLOSED, unless the frame is permitted as described below. 

端点不能在一个已关闭的流上发除了PRIORITY帧以外的帧。端点收到非PRIORITY帧必须处理为流已关闭错误。同样的，在收到带有END_STREAM帧之后收到任何帧都必须视为流关闭类型的连接错误。除非帧符合以下条件：

WINDOW_UPDATE or RST_STREAM frames can be received in this state for a short period after a DATA or HEADERS frame containing an END_STREAM flag is sent. Until the remote peer receives and processes RST_STREAM or the frame bearing the END_STREAM flag, it might send frames of these types. Endpoints MUST ignore WINDOW_UPDATE or RST_STREAM frames received in this state, though endpoints MAY choose to treat frames that arrive a significant time after sending END_STREAM as a connection error (Section 5.4.1) of type PROTOCOL_ERROR. 

WINDOW_UPDATE或RST_STREAM帧可以在收到带有END_STREAM标识的DATA帧或HEADERS帧之后短暂的时期内被接收。直到远程对等端收到并且处理了RST_STREAM或者带有END_STREAM的帧，它可以发送这两类帧。虽然端点可能会选择在发送END_STREAM之后很长时间之后收到帧视为是协议错误类型的连接错误，但是端点必须忽略关闭状态下收到的WINDOW_UPDATE或RST_STREAM帧。

PRIORITY frames can be sent on closed streams to prioritize streams that are dependent on the closed stream. Endpoints SHOULD process PRIORITY frames, though they can be ignored if the stream has been removed from the dependency tree (see Section 5.3.4). 

PRIORITY帧可以在已关闭的流中发送来实现设置依赖于这个已关闭的流的流的优先级。尽管当流已经从依赖树种被移除之后可以忽略PRIORITY帧，但端点还是应该处理PRIORITY帧。

If this state is reached as a result of sending a RST_STREAM frame, the peer that receives the RST_STREAM might have already sent -- or enqueued for sending -- frames on the stream that cannot be withdrawn. An endpoint MUST ignore frames that it receives on closed streams after it has sent a RST_STREAM frame. An endpoint MAY choose to limit the period over which it ignores frames and treat frames that arrive after this time as being in error. 

当流因为发送RST_STREAM帧而变为关闭状态时，收到RST_STREAM帧的对等端可能已经往流中发送，或者准备发送无法撤销的帧。所以端点必须忽视在发送RST_STREAM帧时候收到的帧。端点可以选择在一段时间内忽略这些帧，然后超过这个时间到达的帧都视为错误。

Flow-controlled frames (i.e., DATA) received after sending RST_STREAM are counted toward the connection flow-control window. Even though these frames might be ignored, because they are sent before the sender receives the RST_STREAM, the sender will consider the frames to count against the flow-control window. 

在发送RST_STREAM之后收到的流量控制帧统计入连接的流量控制窗口。虽然这些帧可以被忽略，但是它们是在发送者收到RST_STREAM之前发送的帧，所以发送者会认为这些帧仍然应该计入流量控制窗口。

An endpoint might receive a PUSH_PROMISE frame after it sends RST_STREAM. PUSH_PROMISE causes a stream to become "reserved" even if the associated stream has been reset. Therefore, a RST_STREAM is needed to close an unwanted promised stream.
In the absence of more specific guidance elsewhere in this document, implementations SHOULD treat the receipt of a frame that is not expressly permitted in the description of a state as a connection error (Section 5.4.1) of type PROTOCOL_ERROR. Note that PRIORITY can be sent and received in any stream state. Frames of unknown types are ignored.

端点可能会在发送RST_STREAM之后收到一个PUSH_PROMISE帧。即使在流已经被重置的情况下，PUSH_PROMISE帧也会引起流状态变为保留状态。因此，需要一个RST_STREAM帧来关闭一个不希望被承诺的流。由于这个文档缺乏更明确的指导，实现者应该收到在相应状态下没有明确允许的帧时都处理成连接错误。PRIORITY可以在任何状态下发送或者接收。忽略未知类型的帧。

An example of the state transitions for an HTTP request/response exchange can be found in Section 8.1. An example of the state transitions for server push can be found in Sections 8.2.1 and 8.2.2.



