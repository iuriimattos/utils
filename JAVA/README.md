ROUND 2 DECIMALS WHEN MULTIPLE OF 5

CREDITS me
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

MOCKITO JPA EntityManager
CREDITS me
```
@ContextConfiguration
@TestPropertySource(locations = "classpath:application-test.properties")
@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(classes = App.class, webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
public class ServiceTest {

    @Autowired
    private Service service;

    private ResponseEntity<Void> response;
    private TestRestTemplate template;

    public void executeTest(String id, String user) throws MalformedURLException, URISyntaxException {

        Query q = Mockito.mock(Query.class);
        Mockito.when(q.setParameter(Mockito.anyString(), Mockito.anyString())).thenReturn(q);
        Mockito.when(q.setParameter(Mockito.anyString(), Mockito.any())).thenReturn(q);
        Mockito.when(q.setParameter(Mockito.anyString(), Mockito.anyString())).thenReturn(q);
        Mockito.when(q.executeUpdate()).thenReturn(1);

        EntityManager entityManager = Mockito.mock(EntityManager.class);
        Mockito.when(entityManager.createNativeQuery(Mockito.anyString())).thenReturn(q);

        EntityManagerFactory entityManagerFactory = Mockito.mock(EntityManagerFactory.class);
        Mockito.when(entityManagerFactory.createEntityManager()).thenReturn(entityManager);

        ReflectionTestUtils.setField(service, "entityManager", entityManager);

        response = template.postForEntity(new URL("endpoint/execute/"+id+"?user="+user).toURI(), null, Void.class);
//        request = RequestEntity.post(new URL(getURL(id, user)).toURI())
//                .contentType(MediaType.APPLICATION_JSON)
//                .header("X-JWT-Assertion",
//                        getManualValidJWT())
//                .body(body);
//        response = template.exchange(request, InlineResponse200.class);
    }
}

@Transactional
@Named
public class ServiceImpl implements Service {

    private final Logger log = LoggerFactory.getLogger(ServiceImpl.class);

    @PersistenceContext
    private EntityManager entityManager;

    public ResponseEntity<Void> execute(String id, String user) {

        log.info("id: {} | user: {}", id, user);

        entityManager.createNativeQuery(
                        "INSERT INTO TABLE_1  " +
                                "   (ID, " +
                                "    USER) " +
                                "     SELECT " +
                                "     SEQ_TABLE_1.NEXTVAL, " +
                                "      :user AS USER " +
                                "   FROM " +
                                "        TABLE_2 t2  " +
                                "    INNER JOIN TABLE_3 t3 ON (t3.USER = F.USER)   " +
                                "    INNER JOIN TABLE_4 t4 ON (t4.ID_T1 = t2.ID)   " +
                                "   WHERE " +
                                "      t1.CD = 123 AND t2.CD = 321 AND t3.CD = 456 AND t4.CD = 654 ")
                .setParameter("id", "id")
                .setParameter("user", user)
                .executeUpdate();

        return new ResponseEntity<>(HttpStatus.OK);

    }
}
```
