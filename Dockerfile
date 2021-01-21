# Build Phase
FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# EXPOSE Instruction is for ElasticBeanstalk
FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html
