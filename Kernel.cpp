typedef unsigned int uint;
typedef unsigned short ushort;

typedef char* string;
typedef const char* cstring;

void printf(string str) {
    ushort* vRam = (ushort*)0xb8000;

    for(int i = 0; str[i] != '\0'; ++i)
        vRam[i] = (vRam[i] & 0xFF00) | str[i];
}


void kmain(void* mb_struct, uint magicNum) {
    printf("Hello BIOS!");

    while(1);
}

void _kernel(void* mb_struct, uint magicNum) {
    kmain(mb_struct, magicNum);
}