The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT", "SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this document are to be interpreted as described in RFC 2119 [RFC2119].

All numeric values are in network byte order. Values are unsigned unless otherwise indicated. Literal values are provided in decimal or hexadecimal as appropriate. Hexadecimal literals are prefixed with 0x to distinguish them from decimal literals.

The following terms are used:

client:
The endpoint that initiates an HTTP/2 connection. Clients send HTTP requests and receive HTTP responses.
connection:
A transport-layer connection between two endpoints.
connection error:
An error that affects the entire HTTP/2 connection.
endpoint:
Either the client or server of the connection.
frame:
The smallest unit of communication within an HTTP/2 connection, consisting of a header and a variable-length sequence of octets structured according to the frame type.
peer:
An endpoint. When discussing a particular endpoint, "peer" refers to the endpoint that is remote to the primary subject of discussion.
receiver:
An endpoint that is receiving frames.
sender:
An endpoint that is transmitting frames.
server:
The endpoint that accepts an HTTP/2 connection. Servers receive HTTP requests and serve HTTP responses.
stream:
A bi-directional flow of frames within the HTTP/2 connection.
stream error:
An error on the individual HTTP/2 stream.
Finally, the terms "gateway", "intermediary", "proxy", and "tunnel" are defined in Section 2.3 of [RFC7230]. Intermediaries act as both client and server at different times.

The term "payload body" is defined in Section 3.3 of [RFC7230].

