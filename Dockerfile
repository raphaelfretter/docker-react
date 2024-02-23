FROM registry.redhat.io/rhel9/nodejs-16 as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM registry.redhat.io/rhel9/nginx-120
COPY --from=builder /app/build /usr/share/nginx/html
