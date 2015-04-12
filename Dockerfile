# Builds docker image for minidlna
FROM zoxi/container-debian:latest

MAINTAINER zoxi

# Installation des prérequis
RUN apt-get install -qy curl

# Installation de btsync
RUN sh -c "$(curl -fsSL http://debian.yeasoft.net/add-btsync-repository.sh)" && \
    apt-get update && \
    apt-get install -qy btsync
    
# Ajout du script de configuration
ADD config.sh /config.sh
RUN chmod +x /*.sh && \
    /bin/bash /config.sh
    
# Montage des volumes
VOLUME /config
VOLUME /sync

# Ajout des droits à "/etc/btsync"
RUN chown -R nobody:users /etc/btsync
RUN chmod -R 775 /etc/btsync

# Ajout du script de démarrage
ADD start.sh /start.sh
RUN chmod +x /*.sh

# Passage en user "nobody"
USER nobody

ENTRYPOINT ["/start.sh"]
