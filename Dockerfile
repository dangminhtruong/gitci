FROM alpine

ENV publicKey='ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAAgQDBZMi2n7rjy2/mj8s6Y+HGOU7sL0MtgSGfgVPmjVRYITa9AoNBdncrY9LM6/jMGtjD8KvnZLtOLREUOSGeKghEgF/IR8rri6IX6gEtYYIfwEouScT6WGOi8MIrqBTOugBdWBK3JnOfPIFEO3UCxrgg9rcJ71qqj9u/or8LL1EwRQ== dangminhtruong';

ENV privateKey='-----BEGIN RSA PRIVATE KEY-----\r\nMIICXgIBAAKBgQDBZMi2n7rjy2/mj8s6Y+HGOU7sL0MtgSGfgVPmjVRYITa9AoNB\r\ndncrY9LM6/jMGtjD8KvnZLtOLREUOSGeKghEgF/IR8rri6IX6gEtYYIfwEouScT6\r\nWGOi8MIrqBTOugBdWBK3JnOfPIFEO3UCxrgg9rcJ71qqj9u/or8LL1EwRQIDAQAB\r\nAoGBAIM0zFPSdKo9iHLFVd0MjM2+bcQhoJMLy/L6fCCr+/A6wHdlcAWGyP0AIbFz\r\n2v0mra/p5cb8eXNlcfPleuBipe4bd940yyuXXA0mnFILOTgSdghNO6Slxi7vDYVU\r\nw1s73rywSJbL6ZJ9lFMMfVBk/N75AIM+uzQMWWA7kcVDm5G1AkEA+3eq+cRuNX1k\r\nBOBmaP6A81t8ECdxt1Zj7E8+C5+4i+EDod4V3obtI+HcaRbxY6sKaJFjgKAxK3QJ\r\nmp9akHejOwJBAMThJk/GA4mJqMMEb0AqeUe07/ZVGRuaaCX2FvpUvZBOki6fxcxq\r\nkOE2b2lM/daQcqkGyEBR0dNhXlxzFAGGQn8CQQCDZyb62UBVxy4qtjANkWBEyntr\r\n3ZC4ovYYF9huLoo63dwOC4UWAR+N7opEh+6fjFMmDUMXhZ3r/Pi/yaGDeGDdAkBC\r\nEbCSqse7Gyg4Mb/Hz7kdeDni95HScpGq05fIcDGhQMzLurBdNhHikir3MnAo1ha0\r\nZGNFOm/ouM86xR+cl1qvAkEA5F9d0THNgLLYuLqWZEcL1uDDEgIJqIPyoX4irEQl\r\nSmC7+KTk5+49ntVJ0pLwmLrJHIvESWxJe/x+3oE0QOazpQ==\r\n-----END RSA PRIVATE KEY-----';

ENV target=3

ENV cloneUrl='git@github.com:dangminhtruong/Havana_Laravel.git'

RUN apk --update add git openssh bash && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*

COPY commands.sh /scripts/commands.sh

RUN ["chmod", "+x", "/scripts/commands.sh"]

ENTRYPOINT ["/scripts/commands.sh"]

WORKDIR /