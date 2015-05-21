This document establishes a registry for HTTP/2 error codes. The "HTTP/2 Error Code" registry manages a 32-bit space. The "HTTP/2 Error Code" registry operates under the "Expert Review" policy [RFC5226].

Registrations for error codes are required to include a description of the error code. An expert reviewer is advised to examine new registrations for possible duplication with existing error codes. Use of existing registrations is to be encouraged, but not mandated.

New registrations are advised to provide the following information:

**Name:**

A name for the error code. Specifying an error code name is optional.

**Code:**

The 32-bit error code value.

**Description:**

A brief description of the error code semantics, longer if no detailed specification is provided.

**Specification:**

An optional reference for a specification that defines the error code.

The entries in the following table are registered by this document.


<table class="table full text-left"><thead><tr><th class="left">Name</th><th class="left">Code</th><th class="left">Description</th><th class="left">Specification</th></tr></thead><tbody><tr><td class="left">NO_ERROR</td><td class="left">0x0</td><td class="left">Graceful shutdown</td><td class="left"><a href="#ErrorCodes" title="Error Codes">Section&nbsp;7</a></td></tr><tr><td class="left">PROTOCOL_ERROR</td><td class="left">0x1</td><td class="left">Protocol error detected</td><td class="left"><a href="#ErrorCodes" title="Error Codes">Section&nbsp;7</a></td></tr><tr><td class="left">INTERNAL_ERROR</td><td class="left">0x2</td><td class="left">Implementation fault</td><td class="left"><a href="#ErrorCodes" title="Error Codes">Section&nbsp;7</a></td></tr><tr><td class="left">FLOW_CONTROL_ERROR</td><td class="left">0x3</td><td class="left">Flow-control limits exceeded</td><td class="left"><a href="#ErrorCodes" title="Error Codes">Section&nbsp;7</a></td></tr><tr><td class="left">SETTINGS_TIMEOUT</td><td class="left">0x4</td><td class="left">Settings not acknowledged</td><td class="left"><a href="#ErrorCodes" title="Error Codes">Section&nbsp;7</a></td></tr><tr><td class="left">STREAM_CLOSED</td><td class="left">0x5</td><td class="left">Frame received for closed stream</td><td class="left"><a href="#ErrorCodes" title="Error Codes">Section&nbsp;7</a></td></tr><tr><td class="left">FRAME_SIZE_ERROR</td><td class="left">0x6</td><td class="left">Frame size incorrect</td><td class="left"><a href="#ErrorCodes" title="Error Codes">Section&nbsp;7</a></td></tr><tr><td class="left">REFUSED_STREAM</td><td class="left">0x7</td><td class="left">Stream not processed</td><td class="left"><a href="#ErrorCodes" title="Error Codes">Section&nbsp;7</a></td></tr><tr><td class="left">CANCEL</td><td class="left">0x8</td><td class="left">Stream cancelled</td><td class="left"><a href="#ErrorCodes" title="Error Codes">Section&nbsp;7</a></td></tr><tr><td class="left">COMPRESSION_ERROR</td><td class="left">0x9</td><td class="left">Compression state not updated</td><td class="left"><a href="#ErrorCodes" title="Error Codes">Section&nbsp;7</a></td></tr><tr><td class="left">CONNECT_ERROR</td><td class="left">0xa</td><td class="left">TCP connection error for CONNECT method</td><td class="left"><a href="#ErrorCodes" title="Error Codes">Section&nbsp;7</a></td></tr><tr><td class="left">ENHANCE_YOUR_CALM</td><td class="left">0xb</td><td class="left">Processing capacity exceeded</td><td class="left"><a href="#ErrorCodes" title="Error Codes">Section&nbsp;7</a></td></tr><tr><td class="left">INADEQUATE_SECURITY</td><td class="left">0xc</td><td class="left">Negotiated TLS parameters not acceptable</td><td class="left"><a href="#ErrorCodes" title="Error Codes">Section&nbsp;7</a></td></tr><tr><td class="left">HTTP_1_1_REQUIRED</td><td class="left">0xd</td><td class="left">Use HTTP/1.1 for the request</td><td class="left"><a href="#ErrorCodes" title="Error Codes">Section&nbsp;7</a></td></tr></tbody></table>