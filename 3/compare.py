# Simple Python implementations for comparison
# Two approaches: trial division (simple) and generator-based using primes

target = 600851475143

def largest_prime_trial(n):
    i = 2
    last = 1
    while i * i <= n:
        if n % i == 0:
            last = i
            n //= i
        else:
            i += 1 if i == 2 else 2
    if n > 1:
        last = n
    return last

if __name__ == '__main__':
    print('Python trial-division result:', largest_prime_trial(target))
