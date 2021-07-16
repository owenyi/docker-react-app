FROM node:12 as builder
WORKDIR /usr/src/app
COPY package.json ./
RUN yarn install
COPY ./ ./
# CMD ["yarn", "run", "build"]
RUN yarn run build

FROM nginx
EXPOSE 80
COPY --from=builder /usr/src/app/build /usr/share/nginx/html