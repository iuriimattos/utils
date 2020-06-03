<?php

use Zend\Db\Sql\Select;

// basic table
$select0 = new Select;
$select0->from('foo');
// 'SELECT "foo".* FROM "foo"';


// table as TableIdentifier
$select1 = new Select;
$select1->from(new TableIdentifier('foo', 'bar'));
// 'SELECT "bar"."foo".* FROM "bar"."foo"';


// table with alias
$select2 = new Select;
$select2->from(array('f' => 'foo'));
// 'SELECT "f".* FROM "foo" AS "f"';


// table with alias with table as TableIdentifier
$select3 = new Select;
$select3->from(array('f' => new TableIdentifier('foo')));
// 'SELECT "f".* FROM "foo" AS "f"';


// columns
$select4 = new Select;
$select4->from('foo')->columns(array('bar', 'baz'));
// 'SELECT "foo"."bar" AS "bar", "foo"."baz" AS "baz" FROM "foo"';


// columns with AS associative array
$select5 = new Select;
$select5->from('foo')->columns(array('bar' => 'baz'));
// 'SELECT "foo"."baz" AS "bar" FROM "foo"';


// columns with AS associative array mixed
$select6 = new Select;
$select6->from('foo')->columns(array('bar' => 'baz', 'bam'));
// 'SELECT "foo"."baz" AS "bar", "foo"."bam" AS "bam" FROM "foo"';


// columns where value is Expression, with AS
$select7 = new Select;
$select7->from('foo')->columns(array('bar' => new Expression('COUNT(some_column)')));
// 'SELECT COUNT(some_column) AS "bar" FROM "foo"';


// columns where value is Expression
$select8 = new Select;
$select8->from('foo')->columns(array(new Expression('COUNT(some_column) AS bar')));
// 'SELECT COUNT(some_column) AS bar FROM "foo"';


// columns where value is Expression with parameters
$select9 = new Select;
$select9->from('foo')->columns(
    array(
        new Expression(
            '(COUNT(?) + ?) AS ?',
            array('some_column', 5, 'bar'),
            array(Expression::TYPE_IDENTIFIER, Expression::TYPE_VALUE, Expression::TYPE_IDENTIFIER)
        )
    )
);
// 'SELECT (COUNT("some_column") + ?) AS "bar" FROM "foo"';
//     array('column1' => 5);
//
// 'SELECT (COUNT("some_column") + \'5\') AS "bar" FROM "foo"';

// joins (plain)
$select10 = new Select;
$select10->from('foo')->join('zac', 'm = n');
// 'SELECT "foo".*, "zac".* FROM "foo" INNER JOIN "zac" ON "m" = "n"';


// join with columns
$select11 = new Select;
$select11->from('foo')->join('zac', 'm = n', array('bar', 'baz'));
// 'SELECT "foo".*, "zac"."bar" AS "bar", "zac"."baz" AS "baz" FROM "foo" INNER JOIN "zac" ON "m" = "n"';


// join with alternate type
$select12 = new Select;
$select12->from('foo')->join('zac', 'm = n', array('bar', 'baz'), Select::JOIN_OUTER);
// 'SELECT "foo".*, "zac"."bar" AS "bar", "zac"."baz" AS "baz" FROM "foo" OUTER JOIN "zac" ON "m" = "n"';


// join with column aliases
$select13 = new Select;
$select13->from('foo')->join('zac', 'm = n', array('BAR' => 'bar', 'BAZ' => 'baz'));
// 'SELECT "foo".*, "zac"."bar" AS "BAR", "zac"."baz" AS "BAZ" FROM "foo" INNER JOIN "zac" ON "m" = "n"';


// join with table aliases
$select14 = new Select;
$select14->from('foo')->join(array('b' => 'bar'), 'b.foo_id = foo.foo_id');
// 'SELECT "foo".*, "b".* FROM "foo" INNER JOIN "bar" AS "b" ON "b"."foo_id" = "foo"."foo_id"';


// where (simple string)
$select15 = new Select;
$select15->from('foo')->where('x = 5');
// 'SELECT "foo".* FROM "foo" WHERE x = 5';


// where (returning parameters)
$select16 = new Select;
$select16->from('foo')->where(array('x = ?' => 5));
// 'SELECT "foo".* FROM "foo" WHERE x = ?';
//   array('where1' => 5);
//
// 'SELECT "foo".* FROM "foo" WHERE x = \'5\'';


// group
$select17 = new Select;
$select17->from('foo')->group(array('col1', 'col2'));
// 'SELECT "foo".* FROM "foo" GROUP BY "col1", "col2"';


$select18 = new Select;
$select18->from('foo')->group('col1')->group('col2');
// 'SELECT "foo".* FROM "foo" GROUP BY "col1", "col2"';


$select19 = new Select;
$select19->from('foo')->group(new Expression('DAY(?)', array('col1'), array(Expression::TYPE_IDENTIFIER)));
// 'SELECT "foo".* FROM "foo" GROUP BY DAY("col1")';


// having (simple string)
$select20 = new Select;
$select20->from('foo')->having('x = 5');
// 'SELECT "foo".* FROM "foo" HAVING x = 5';


// having (returning parameters)
$select21 = new Select;
$select21->from('foo')->having(array('x = ?' => 5));
// 'SELECT "foo".* FROM "foo" HAVING x = ?';
//   array('having1' => 5);
//
// 'SELECT "foo".* FROM "foo" HAVING x = \'5\'';


// order
$select22 = new Select;
$select22->from('foo')->order('c1');
// 'SELECT "foo".* FROM "foo" ORDER BY "c1" ASC';


// multiple order parts
$select23 = new Select;
$select23->from('foo')->order(array('c1', 'c2'));
// 'SELECT "foo".* FROM "foo" ORDER BY "c1" ASC, "c2" ASC';


// mulitple order parts
$select24 = new Select;
$select24->from('foo')->order(array('c1' => 'DESC', 'c2' => 'Asc')); // notice partially lower case ASC
// 'SELECT "foo".* FROM "foo" ORDER BY "c1" DESC, "c2" ASC';


$select25 = new Select;
$select25->from('foo')->order(array('c1' => 'asc'))->order('c2 desc'); // notice partially lower case ASC
// 'SELECT "foo".* FROM "foo" ORDER BY "c1" ASC, "c2" DESC';


// limit
$select26 = new Select;
$select26->from('foo')->limit(5);
// 'SELECT "foo".* FROM "foo" LIMIT ?';
//   array('limit' => 5);
//
// 'SELECT "foo".* FROM "foo" LIMIT \'5\'';


// limit with offset
$select27 = new Select;
$select27->from('foo')->limit(5)->offset(10);
// 'SELECT "foo".* FROM "foo" LIMIT ? OFFSET ?';
//   array('limit' => 5, 'offset' => 10);
//
// 'SELECT "foo".* FROM "foo" LIMIT \'5\' OFFSET \'10\'';


// joins with a few keywords in the on clause
$select28 = new Select;
$select28->from('foo')->join('zac', '(m = n AND c.x) BETWEEN x AND y.z');
// 'SELECT "foo".*, "zac".* FROM "foo" INNER JOIN "zac" ON ("m" = "n" AND "c"."x") BETWEEN "x" AND "y"."z"';


// order with compound name
$select29 = new Select;
$select29->from('foo')->order('c1.d2');
// 'SELECT "foo".* FROM "foo" ORDER BY "c1"."d2" ASC';


// group with compound name
$select30 = new Select;
$select30->from('foo')->group('c1.d2');
// 'SELECT "foo".* FROM "foo" GROUP BY "c1"."d2"';


// join with expression in ON part
$select31 = new Select;
$select31->from('foo')->join('zac', new Expression('(m = n AND c.x) BETWEEN x AND y.z'));
// 'SELECT "foo".*, "zac".* FROM "foo" INNER JOIN "zac" ON (m = n AND c.x) BETWEEN x AND y.z';


// subselects
$select32subselect = new Select;
$select32subselect->from('bar')->where->like('y', '%Foo%');
$select32 = new Select;
$select32->from(array('x' => $select32subselect));
// 'SELECT "x".* FROM (SELECT "bar".* FROM "bar" WHERE "y" LIKE ?) AS "x"';
// 'SELECT "x".* FROM (SELECT "bar".* FROM "bar" WHERE "y" LIKE \'%Foo%\') AS "x"';


// use array in where, predicate in where
$select33 = new Select;
$select33->from('table')->columns(array('*'))->where(array(
    'c1' => null,
    'c2' => array(1, 2, 3),
    new \Zend\Db\Sql\Predicate\IsNotNull('c3')
));
// 'SELECT "table".* FROM "table" WHERE "c1" IS NULL AND "c2" IN (?, ?, ?) AND "c3" IS NOT NULL';
// 'SELECT "table".* FROM "table" WHERE "c1" IS NULL AND "c2" IN (\'1\', \'2\', \'3\') AND "c3" IS NOT NULL';


// Expression objects in order
$select34 = new Select;
$select34->from('table')->order(array(
    new Expression('isnull(?) DESC', array('name'), array(Expression::TYPE_IDENTIFIER)),
    'name'
));
// 'SELECT "table".* FROM "table" ORDER BY isnull("name") DESC, "name" ASC';


// join with Expression object in COLUMNS part (ZF2-514)
$select35 = new Select;
$select35->from('foo')->columns(array())->join('bar', 'm = n', array('thecount' => new Expression("COUNT(*)")));
// 'SELECT COUNT(*) AS "thecount" FROM "foo" INNER JOIN "bar" ON "m" = "n"';


// multiple joins with expressions
$select36 = new Select;
$select36->from('foo')
    ->join('tableA', new Predicate\Operator('id', '=', 1))
    ->join('tableB', new Predicate\Operator('id', '=', 2))
    ->join('tableC', new Predicate\PredicateSet(array(
        new Predicate\Operator('id', '=', 3),
        new Predicate\Operator('number', '>', 20)
    )));
// 'SELECT "foo".*, "tableA".*, "tableB".*, "tableC".* FROM "foo" '
//   'INNER JOIN "tableA" ON "id" = :join1part1 INNER JOIN "tableB" ON "id" = :join2part1 '
//   'INNER JOIN "tableC" ON "id" = :join3part1 AND "number" > :join3part2';
//
// 'SELECT "foo".*, "tableA".*, "tableB".*, "tableC".* FROM "foo" '
//   'INNER JOIN "tableA" ON "id" = \'1\' INNER JOIN "tableB" ON "id" = \'2\' '
//   'INNER JOIN "tableC" ON "id" = \'3\' AND "number" > \'20\'';