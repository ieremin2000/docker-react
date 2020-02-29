# multi-step docker build

# build phase
# AS builder specified a builder phase
FROM node:alpine AS builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# run phase
# /app/build <- all the stuff - result of the build
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html





