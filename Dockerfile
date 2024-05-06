FROM node:latest as build

WORKDIR /usr/local/app
COPY ./ /usr/local/app/

RUN npm install -g pnpm
RUN pnpm install
RUN pnpm run build

FROM nginx:latest

COPY --from=build /usr/local/app/dist/todoapp/browser /usr/share/nginx/html

EXPOSE 80
