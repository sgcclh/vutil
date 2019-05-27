FROM node:8 as build
WORKDIR /app
COPY . ./
RUN npm install
FROM node:8-alpine
RUN \
  apk update && \
  apk --no-cache add ca-certificates openssl ipmitool
WORKDIR /app
COPY --from=build /app ./
EXPOSE 3000
CMD ["node", "server.js"]
