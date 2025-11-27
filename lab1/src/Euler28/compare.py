def spiral_sum(n):
    total = 1
    for k in range(1, (n - 1)//2 + 1):
        total += 16*k*k + 4*k + 4
    return total

if __name__ == '__main__':
    print('Python spiral sum (n=1001):', spiral_sum(1001))
