All frames begin with a fixed 9-octet header followed by a variable-length payload.
每个帧都是以9个字节的头部开始的，后面接着可变长度的数据。

	+-----------------------------------------------+
	|                 Length (24)                   |
	+---------------+---------------+---------------+
	|   Type (8)    |   Flags (8)   |
	+-+-------------+---------------+-------------------------------+
	|R|                 Stream Identifier (31)                      |
	+=+=============================================================+
	|                   Frame Payload (0...)                      ...
	+---------------------------------------------------------------+
Figure 1: Frame Layout

The fields of the frame header are defined as:

帧头部字段定义如下：

**Length:**
The length of the frame payload expressed as an unsigned 24-bit integer. Values greater than 2^14 (16,384) MUST NOT be sent unless the receiver has set a larger value for SETTINGS_MAX_FRAME_SIZE. 

The 9 octets of the frame header are not included in this value.

帧的数据长度用一个24位的整数表示。但是，除非接收者给SETTINGS_MAX_FRAME_SIZE设置了更大的值，否则数据长度不要超过2^14 (16384)字节。

头部的9字节不算在这个长度里。

**Type:**
The 8-bit type of the frame. The frame type determines the format and semantics of the frame. Implementations MUST ignore and discard any frame that has a type that is unknown.

接下来的8比特表示帧类型。帧类型决定了帧的格式和语义。协议实现者必须忽略并丢弃类型为unknown类型的帧。

**Flags:**
An 8-bit field reserved for boolean flags specific to the frame type. 

Flags are assigned semantics specific to the indicated frame type. Flags that have no defined semantics for a particular frame type MUST be ignored and MUST be left unset (0x0) when sending.

有8个比特是为帧类型相关的布尔标识预留的。

标识对于不同的帧类型赋予了不同的语义。如果标识对于某种帧类型没有定义语义，则它必须被忽略且发送的时候应该赋值为(0x0)。

**R:**
A reserved 1-bit field. The semantics of this bit are undefined, and the bit MUST remain unset (0x0) when sending and MUST be ignored when receiving.

R是一个保留的比特字段。这个比特的语义没有定义，发送时它必须被设置为(0x0), 接收时需要忽略。

**Stream Identifier:**
A stream identifier (see Section 5.1.1) expressed as an unsigned 31-bit integer. The value 0x0 is reserved for frames that are associated with the connection as a whole as opposed to an individual stream.

The structure and content of the frame payload is dependent entirely on the frame type.

流标识用31比特的无符号整数表示。值0x0是保留的，表示帧是于与连接作为整体的，而不是单独的流。

帧负载的内容和结构完全依赖于帧类型。
