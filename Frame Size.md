The size of a frame payload is limited by the maximum size that a receiver advertises in the SETTINGS_MAX_FRAME_SIZE setting. This setting can have any value between 2^14 (16,384) and 2^24-1 (16,777,215) octets, inclusive.

帧的有效负载的大小受到接收者广播的SETTINGS_MAX_FRAME_SIZE限制。大小可以是2^14 (16,384)字节到2^24-1 (16,777,215)字节之间的任意值。

All implementations MUST be capable of receiving and minimally processing frames up to 2^14 octets in length, plus the 9-octet frame header (Section 4.1). The size of the frame header is not included when describing frame sizes.

所有的协议实现必须能够接收和处理长度大于等于2^14字节的帧，加上9字节的帧头部。帧长度不包括帧头部的长度。

+	Note: Certain frame types, such as PING (Section 6.7), impose additional limits on the amount of payload data allowed.

+   注意：对于特定类型的帧，例如PING帧，可以给负载长度设置另外的大小限制。

An endpoint MUST send an error code of FRAME_SIZE_ERROR if a frame exceeds the size defined in SETTINGS_MAX_FRAME_SIZE, exceeds any limit defined for the frame type, or is too small to contain mandatory frame data. A frame size error in a frame that could alter the state of the entire connection MUST be treated as a connection error (Section 5.4.1); this includes any frame carrying a header block (Section 4.3) (that is, HEADERS, PUSH_PROMISE, and CONTINUATION), SETTINGS, and any frame with a stream identifier of 0.

如果一个帧大小超过了SETTINGS_MAX_FRAME_SIZE，或者超过了对应类型的帧的长度限制，或者达不到强制的帧数据的最小长度，端点必须发送错误码FRAME_SIZE_ERROR。一个能够影响整个连接状态的帧大小错误必须按照连接错误来对待。包括任何携带头部块（即，HEADERS, PUSH_PROMISE, and CONTINUATION），设置帧，以及任何流id为0的帧。

Endpoints are not obligated to use all available space in a frame. Responsiveness can be improved by using frames that are smaller than the permitted maximum size. Sending large frames can result in delays in sending time-sensitive frames (such as RST_STREAM, WINDOW_UPDATE, or PRIORITY), which, if blocked by the transmission of a large frame, could affect performance.

端不必使用帧的所有可用空间。通过使用大小小于最大限制的帧可以提高响应性能（即推荐使用小一点的帧）。发送大的帧可能延误时间敏感型的帧（例如RST_STREAM, WINDOW_UPDATE, 和 PRIORITY帧）的发送，这些帧的发送如果被大帧的传输阻塞，则会影响性能表现。

