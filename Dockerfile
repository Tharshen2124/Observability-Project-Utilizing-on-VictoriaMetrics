# Stage 1: Build
FROM golang:1.26-alpine AS builder
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY . .
RUN CGO_ENABLED=0 go build -ldflags="-s -w" -o server .

# Stage 2: Run
FROM scratch
WORKDIR /app
COPY --from=builder /app/server .
EXPOSE 8000
CMD ["./server"]