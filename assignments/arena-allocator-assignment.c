#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

#define ARENA_SIZE 1024

typedef struct {
    uint8_t memory[ARENA_SIZE];
    size_t offset;
} Arena;

// Initialize the arena
void arena_init(Arena* a) {
    a->offset = 0;
}

// TODO: Implement this function
void* arena_alloc(Arena* a, size_t size) {
    // 1. Check if there is enough space left in the arena (ARENA_SIZE - current offset).
    if (size <= ARENA_SIZE - a->offset) {
    // 3. If there is, calculate the pointer to the current free memory.
        void* temp = &a->memory[a->offset];
        // 4. Increment the offset by 'size'.
        a->offset += size;
        // 5. Return the pointer.
        return temp;
    }
    // 2. If not, return NULL.
    else {
        return NULL;
    }
}

int main() {
    Arena my_arena;
    arena_init(&my_arena);

    int* num = (int*)arena_alloc(&my_arena, sizeof(int));
    if (num) {
        *num = 42;
        printf("Allocated number: %d\n", *num);
    } else {
        printf("Allocation failed!\n");
    }

    // Try allocating more than the remaining space to test your error handling
    char* big_string = (char*)arena_alloc(&my_arena, 2048);
    if (!big_string) printf("Successfully caught out-of-memory error!\n");

    return 0;
}