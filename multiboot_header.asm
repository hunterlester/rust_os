section .multiboot_header
header_start:
    dd 0xe85250d6 		 ; magic number required at the start of a multiboot header
    dd 0 			 ; lets GRUB know that we want to boot in protected mode
    dd header_end - header_start ; header length

    ; checksum
    dd 0x100000000 - (0xe85250d6 + 0 + (header_end - header_start)) ; header length

    ; required end tag
    dw 0 ; type
    dw 0 ; flags
    dd 8 ; size
header_end:
