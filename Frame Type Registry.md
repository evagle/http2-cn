This document establishes a registry for HTTP/2 frame type codes. The "HTTP/2 Frame Type" registry manages an 8-bit space. The "HTTP/2 Frame Type" registry operates under either of the "IETF Review" or "IESG Approval" policies [RFC5226] for values between 0x00 and 0xef, with values between 0xf0 and 0xff being reserved for Experimental Use.

New entries in this registry require the following information:

**Frame Type:**

A name or label for the frame type.

**Code:**

The 8-bit code assigned to the frame type.

**Specification:**

A reference to a specification that includes a description of the frame layout, its semantics, and flags that the frame type uses, including any parts of the frame that are conditionally present based on the value of flags.

The entries in the following table are registered by this document.

<table>
<tr>
	<td><strong>Frame</strong></td> <td><strong>Type	Code</strong></td>	<td><strong>Section</strong></td>
</tr>
<tr>
<td>DATA</td> <td>	0x0</td> <td>	Section 6.1</td>
</tr>
<tr>
<td>HEADERS</td> <td>	0x1	</td> <td>Section 6.2</td>
</tr>
<tr>
<td>PRIORITY</td> <td>	0x2</td> <td>	Section 6.3</td>
</tr>
<tr>
<td>RST_STREAM</td> <td>	0x3	</td> <td>Section 6.4</td>
</tr>
<tr>
<td>SETTINGS</td> <td>	0x4</td> <td>	Section 6.5</td>
</tr>
<tr>
<td>PUSH_PROMISE</td> <td>	0x5	</td> <td>Section 6.6</td>
</tr>
<tr>
<td>PING</td> <td>	0x6	</td> <td>Section 6.7</td>
</tr>
<tr>
<td>GOAWAY</td> <td>	0x7	</td> <td>Section 6.8</td>
</tr>
<tr>
<td>WINDOW_UPDATE</td> <td>	0x8</td> <td>	Section 6.9</td>
</tr>
<tr>
<td>CONTINUATION	</td> <td>0x9</td> <td>	Section 6.10</td>
</tr>
</table>
