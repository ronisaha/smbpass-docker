# smbpass
Docker image with smbpass

## Image Variants
### smbpass
Use this to build your custom script. This just smbpasswd tool installed

```bash
docker run --rm -it ronisaha/smbpass /bin/bash
```

### smbpass:reset
Use this to reset your password to same as current. The script change two password internally.

```bash
docker run --rm -it ronisaha/smbpass:reset domain user
```

### smbpass:change
Use this to Change your password

```bash
docker run --rm -it ronisaha/smbpass:change domain user
```
