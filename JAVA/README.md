ROUND 2 DECIMALS WHEN MULTIPLE OF 5
```
public static BigDecimal roundWhenMultipleOf5(BigDecimal bigDecimal) {
  BigDecimal digits = bigDecimal.remainder(BigDecimal.ONE).movePointRight(bigDecimal.scale());
  boolean hasMinThreeDigits = digits.precision() - digits.scale() >= 3;
  boolean isEven = hasMinThreeDigits ? !digits.toBigInteger().divide(BigInteger.TEN).testBit(0) : !digits.toBigInteger().testBit(0);
  boolean isMultipleOf5 = BigInteger.ZERO.equals(digits.remainder(new BigDecimal(5)).toBigInteger());
  if (isMultipleOf5) {
    return isEven ? bigDecimal.setScale(2, RoundingMode.HALF_EVEN) : bigDecimal.setScale(2, RoundingMode.HALF_UP);
  } else {
    return hasMinThreeDigits ? bigDecimal.setScale(2) : bigDecimal;
  }
}
```

CREDITS https://stackoverflow.com/a/58560435
```
public class NumberUtils {

    private NumberUtils() {
    }

    public static <T extends Number> T getNumberOrZero(T number, Class<? extends Number> clazz) {
        return Optional.ofNullable(number)
            .orElse(getZeroValue(clazz));
    }

    @SuppressWarnings("unchecked")
    private static <T extends Number> T getZeroValue(Class<? extends Number> clazz) {
        try {
            Constructor<? extends Number> constructor = clazz.getDeclaredConstructor(String.class);
            return (T) constructor.newInstance("0");
        } catch (ReflectiveOperationException e) {
            throw new IllegalArgumentException("Can't get zero value ", e);
        }
    }
}
```
