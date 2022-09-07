FROM node:12.18.3
WORKDIR /
# Remember, `docker history` will show this line exactly as here,
# including the credentials.
RUN git clone https://username:password@github.com/username/Portfolio.git

# Change directories into what got checked out.
WORKDIR /Portfolio
# All of the files are already there, so we only need to
RUN npm install
EXPOSE 8080
CMD ["pm2", "start", "./bin/ww"]
