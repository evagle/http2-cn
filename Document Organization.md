The HTTP/2 specification is split into four parts:

Starting HTTP/2 (Section 3) covers how an HTTP/2 connection is initiated.
The framing (Section 4) and streams (Section 5) layers describe the way HTTP/2 frames are structured and formed into multiplexed streams.
Frame (Section 6) and error (Section 7) definitions include details of the frame and error types used in HTTP/2.
HTTP mappings (Section 8) and additional requirements (Section 9) describe how HTTP semantics are expressed using frames and streams.
While some of the frame and stream layer concepts are isolated from HTTP, this specification does not define a completely generic framing layer. The framing and streams layers are tailored to the needs of the HTTP protocol and server push.

