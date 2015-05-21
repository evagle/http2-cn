This document establishes a registry for HTTP/2 settings. The "HTTP/2 Settings" registry manages a 16-bit space. The "HTTP/2 Settings" registry operates under the "Expert Review" policy [RFC5226] for values in the range from 0x0000 to 0xefff, with values between and 0xf000 and 0xffff being reserved for Experimental Use.

New registrations are advised to provide the following information:

**Name:**

A symbolic name for the setting. Specifying a setting name is optional.

**Code:**

The 16-bit code assigned to the setting.

**Initial Value:**

An initial value for the setting.

**Specification:**
An optional reference to a specification that describes the use of the setting.

The entries in the following table are registered by this document.

<table class="table full text-left"><thead><tr><th class="left">Name</th><th class="left">Code</th><th class="left">Initial Value</th><th class="left">Specification</th></tr></thead><tbody><tr><td class="left">HEADER_TABLE_SIZE</td><td class="left">0x1</td><td class="left">4096</td><td class="left"><a href="#SettingValues" title="Defined SETTINGS Parameters">Section&nbsp;6.5.2</a></td></tr><tr><td class="left">ENABLE_PUSH</td><td class="left">0x2</td><td class="left">1</td><td class="left"><a href="#SettingValues" title="Defined SETTINGS Parameters">Section&nbsp;6.5.2</a></td></tr><tr><td class="left">MAX_CONCURRENT_STREAMS</td><td class="left">0x3</td><td class="left">(infinite)</td><td class="left"><a href="#SettingValues" title="Defined SETTINGS Parameters">Section&nbsp;6.5.2</a></td></tr><tr><td class="left">INITIAL_WINDOW_SIZE</td><td class="left">0x4</td><td class="left">65535</td><td class="left"><a href="#SettingValues" title="Defined SETTINGS Parameters">Section&nbsp;6.5.2</a></td></tr><tr><td class="left">MAX_FRAME_SIZE</td><td class="left">0x5</td><td class="left">16384</td><td class="left"><a href="#SettingValues" title="Defined SETTINGS Parameters">Section&nbsp;6.5.2</a></td></tr><tr><td class="left">MAX_HEADER_LIST_SIZE</td><td class="left">0x6</td><td class="left">(infinite)</td><td class="left"><a href="#SettingValues" title="Defined SETTINGS Parameters">Section&nbsp;6.5.2</a></td></tr></tbody></table>