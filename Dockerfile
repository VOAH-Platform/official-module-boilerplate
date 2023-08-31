FROM golang:alpine AS backend-builder

WORKDIR /build
COPY ./backend/go.mod ./backend/go.sum ./
RUN go mod download
COPY ./backend/ .
RUN go build -o main .

FROM node:18-alpine AS frontend-builder
WORKDIR /build
COPY ./frontend/ ./
RUN npm install
RUN npm run build

FROM scratch
COPY --from=backend-builder /build/main .
COPY --from=frontend-builder /build/dist/ ./public
ENTRYPOINT ["/main"]