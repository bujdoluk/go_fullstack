# Stage 1: Build the Go app
FROM golang:1.22 AS builder

# Set the Current Working Directory inside the container
WORKDIR /app

# Copy go.mod and go-sum files
COPY go.mod go.sum ./

# Download all dependencies. Dependencies will be cached if the go.mod and go.sum files are not changed
RUN go mod download

# Copy the source code
COPY . .

# Build the application
RUN CGO_ENABLED=0 GOOS=linux go build -o main .

# Stage 2: Run the app
FROM alpine:latest  

# Copy the binary from builder stage
COPY --from=builder /app/main /app/main

# Expose port 8080
EXPOSE 8080

# Command to run the executable
ENTRYPOINT ["/app/main"]