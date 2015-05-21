An HTTP/2 connection is an application-layer protocol running on top of a TCP connection ([TCP]). The client is the TCP connection initiator.

HTTP/2连接是运行在TCP连接上的应用层协议。客户端是TCP连接的发起者。

HTTP/2 uses the same "http" and "https" URI schemes used by HTTP/1.1. HTTP/2 shares the same default port numbers: 80 for "http" URIs and 443 for "https" URIs. As a result, implementations processing requests for target resource URIs like http://example.org/foo or https://example.com/bar are required to first discover whether the upstream server (the immediate peer to which the client wishes to establish a connection) supports HTTP/2. 

HTTP/2使用和HTTP/1.1一样的“http”和“https" URI。HTTP也使用同样的默认端口：“http”的80和“https”的443。因此，请求类似http://example.org/foo 或 https://example.com/bar的URI前需要先判断上游(和客户端直接相连的端，可以是服务器或代理中介)是否支持HTTP/2。

The means by which support for HTTP/2 is determined is different for "http" and "https" URIs. Discovery for "http" URIs is described in Section 3.2. Discovery for "https" URIs is described in Section 3.3.

“http" URI和“https” URI判断上游是否支持HTTP/2的方法是不一样的。“http” URI的判断方法在3.2节描述。“https” URI的判断方法在3.3描述。
