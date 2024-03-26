# Titan Node
---
An unofficial Docker Image for Titan Network Node Available on Docker Hub

Source code available at: [GitHub](https://github.com/cyrus0880/titan-node)

```
### supports RPi3 or  (ARM64/ARMv7/ARMv8/AMD64) ###
```

### What's SeaLink Newwork?
---
titan Network is a digital resource network that incentivizes matching community idle resources with global demand, making it easy for everyone to leverage the power of DePIN services and participate in the construction of the Internet of Value.

### How to get started?
> 1.Register a Titan Account if you don't have one already: [titannet.io](https://test1.titannet.io/intiveRegister?code=oObYFh)

> 2.Either build this image from source, or download it from Docker Hub

> 3.Set Volumes: ./titanedge:/root/.titanedge  for storage node data & wallet sync data and config

> 4.Set envriomental variables to their respective values: TOKEN and go to here get your [identity code](https://titannet.gitbook.io/titan-network-en/huygens-testnet/installation-and-earnings/bind-the-identity-code)

> 5.You're good to go! Once started,

### Docker Compose
---
> 1. ``` mkdir titan-node```

> 2.  ```nano titan-node/docker-compose.yml```
 
docker-compose.yml
```yaml
version: "3.8"
services:
  titan-node:
    restart: unless-stopped
    image: cyrus0880/titan-network:latest
    volumes:
      - ./titanedge:/root/.titanedge
    networks:
      - host-wan
    tty: true
    stdin_open: true
    environment:
      - TOKEN=${Your identity code}
networks:
  host-wan:
    external: true
```
> 3. ```cd titan-node ```

> 4. ``` docker-compose up -d ```

> Done

### License
---
This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

### if you like this project
----
you can [ buy me a coffee ](https://www.buymeacoffee.com/cyrus.yeung)
