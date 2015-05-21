This document creates two registrations for the identification of HTTP/2 (see Section 3.3) in the "Application-Layer Protocol Negotiation (ALPN) Protocol IDs" registry established in [TLS-ALPN].

The "h2" string identifies HTTP/2 when used over TLS:

**Protocol:**

HTTP/2 over TLS

**Identification Sequence:**

0x68 0x32 ("h2")

**Specification:**

This document
The "h2c" string identifies HTTP/2 when used over cleartext TCP:

**Protocol:**

HTTP/2 over TCP

**Identification Sequence:**

0x68 0x32 0x63 ("h2c")

**Specification:**

This document
