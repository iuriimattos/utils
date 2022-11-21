# [org.apache.commons.io.IOUtils](https://commons.apache.org/proper/commons-io/apidocs/org/apache/commons/io/IOUtils.html)

public class [IOUtils](https://commons.apache.org/proper/commons-io/apidocs/src-html/org/apache/commons/io/IOUtils.html#line.106)
extends [Object](https://docs.oracle.com/javase/7/docs/api/java/lang/Object.html?is-external=true "class or interface in java.lang")

General IO stream manipulation utilities.

This class provides static utility methods for input/output operations.

-   **[Deprecated]** closeQuietly - these methods close a stream ignoring nulls and exceptions
-   toXxx/read - these methods read data from a stream
-   write - these methods write data to a stream
-   copy - these methods copy all the data from one stream to another
-   contentEquals - these methods compare the content of two streams

The byte-to-char methods and char-to-byte methods involve a conversion step. Two methods are provided in each case, one that uses the platform default encoding and the other which allows you to specify an encoding. You are encouraged to always specify an encoding because relying on the platform default can lead to unexpected results, for example when moving from development to production.

All the methods in this class that read a stream are buffered internally. This means that there is no cause to use a `BufferedInputStream` or `BufferedReader`. The default buffer size of 4K has been shown to be efficient in tests.

The various copy methods all delegate the actual copying to one of the following methods:

-   [`copyLarge(InputStream, OutputStream, byte[])`](https://commons.apache.org/proper/commons-io/apidocs/org/apache/commons/io/IOUtils.html#copyLarge-java.io.InputStream-java.io.OutputStream-byte:A-)
-   [`copyLarge(InputStream, OutputStream, long, long, byte[])`](https://commons.apache.org/proper/commons-io/apidocs/org/apache/commons/io/IOUtils.html#copyLarge-java.io.InputStream-java.io.OutputStream-long-long-byte:A-)
-   [`copyLarge(Reader, Writer, char[])`](https://commons.apache.org/proper/commons-io/apidocs/org/apache/commons/io/IOUtils.html#copyLarge-java.io.Reader-java.io.Writer-char:A-)
-   [`copyLarge(Reader, Writer, long, long, char[])`](https://commons.apache.org/proper/commons-io/apidocs/org/apache/commons/io/IOUtils.html#copyLarge-java.io.Reader-java.io.Writer-long-long-char:A-)

For example, [`copy(InputStream, OutputStream)`](https://commons.apache.org/proper/commons-io/apidocs/org/apache/commons/io/IOUtils.html#copy-java.io.InputStream-java.io.OutputStream-) calls [`copyLarge(InputStream, OutputStream)`](https://commons.apache.org/proper/commons-io/apidocs/org/apache/commons/io/IOUtils.html#copyLarge-java.io.InputStream-java.io.OutputStream-) which calls [`copy(InputStream, OutputStream, int)`](https://commons.apache.org/proper/commons-io/apidocs/org/apache/commons/io/IOUtils.html#copy-java.io.InputStream-java.io.OutputStream-int-) which creates the buffer and calls [`copyLarge(InputStream, OutputStream, byte[])`](https://commons.apache.org/proper/commons-io/apidocs/org/apache/commons/io/IOUtils.html#copyLarge-java.io.InputStream-java.io.OutputStream-byte:A-).

Applications can re-use buffers by using the underlying methods directly. This may improve performance for applications that need to do a lot of copying.

Wherever possible, the methods in this class do *not* flush or close the stream. This is to avoid making non-portable assumptions about the streams' origin and further use. Thus the caller is still responsible for closing streams after use.

Origin of code: Excalibur.

[closeQuietly](https://www.tabnine.com/code/java/methods/org.apache.commons.io.IOUtils/closeQuietly)

[toString](https://www.tabnine.com/code/java/methods/org.apache.commons.io.IOUtils/toString)

[copy](https://www.tabnine.com/code/java/methods/org.apache.commons.io.IOUtils/copy)

[toByteArray](https://www.tabnine.com/code/java/methods/org.apache.commons.io.IOUtils/toByteArray)

[write](https://www.tabnine.com/code/java/methods/org.apache.commons.io.IOUtils/write)

[toInputStream](https://www.tabnine.com/code/java/methods/org.apache.commons.io.IOUtils/toInputStream)

[readLines](https://www.tabnine.com/code/java/methods/org.apache.commons.io.IOUtils/readLines)

[copyLarge](https://www.tabnine.com/code/java/methods/org.apache.commons.io.IOUtils/copyLarge)

[lineIterator](https://www.tabnine.com/code/java/methods/org.apache.commons.io.IOUtils/lineIterator)

[readFully](https://www.tabnine.com/code/java/methods/org.apache.commons.io.IOUtils/readFully)

# [org.apache.commons.io.FileUtils](https://commons.apache.org/proper/commons-io/apidocs/org/apache/commons/io/FileUtils.html)

public class [IOUtils](https://commons.apache.org/proper/commons-io/apidocs/src-html/org/apache/commons/io/IOUtils.html#line.106)
extends [Object](https://docs.oracle.com/javase/7/docs/api/java/lang/Object.html?is-external=true "class or interface in java.lang")

General IO stream manipulation utilities.

This class provides static utility methods for input/output operations.

-   **[Deprecated]** closeQuietly - these methods close a stream ignoring nulls and exceptions
-   toXxx/read - these methods read data from a stream
-   write - these methods write data to a stream
-   copy - these methods copy all the data from one stream to another
-   contentEquals - these methods compare the content of two streams

The byte-to-char methods and char-to-byte methods involve a conversion step. Two methods are provided in each case, one that uses the platform default encoding and the other which allows you to specify an encoding. You are encouraged to always specify an encoding because relying on the platform default can lead to unexpected results, for example when moving from development to production.

All the methods in this class that read a stream are buffered internally. This means that there is no cause to use a `BufferedInputStream` or `BufferedReader`. The default buffer size of 4K has been shown to be efficient in tests.

The various copy methods all delegate the actual copying to one of the following methods:

-   [`copyLarge(InputStream, OutputStream, byte[])`](https://commons.apache.org/proper/commons-io/apidocs/org/apache/commons/io/IOUtils.html#copyLarge-java.io.InputStream-java.io.OutputStream-byte:A-)
-   [`copyLarge(InputStream, OutputStream, long, long, byte[])`](https://commons.apache.org/proper/commons-io/apidocs/org/apache/commons/io/IOUtils.html#copyLarge-java.io.InputStream-java.io.OutputStream-long-long-byte:A-)
-   [`copyLarge(Reader, Writer, char[])`](https://commons.apache.org/proper/commons-io/apidocs/org/apache/commons/io/IOUtils.html#copyLarge-java.io.Reader-java.io.Writer-char:A-)
-   [`copyLarge(Reader, Writer, long, long, char[])`](https://commons.apache.org/proper/commons-io/apidocs/org/apache/commons/io/IOUtils.html#copyLarge-java.io.Reader-java.io.Writer-long-long-char:A-)

For example, [`copy(InputStream, OutputStream)`](https://commons.apache.org/proper/commons-io/apidocs/org/apache/commons/io/IOUtils.html#copy-java.io.InputStream-java.io.OutputStream-) calls [`copyLarge(InputStream, OutputStream)`](https://commons.apache.org/proper/commons-io/apidocs/org/apache/commons/io/IOUtils.html#copyLarge-java.io.InputStream-java.io.OutputStream-) which calls [`copy(InputStream, OutputStream, int)`](https://commons.apache.org/proper/commons-io/apidocs/org/apache/commons/io/IOUtils.html#copy-java.io.InputStream-java.io.OutputStream-int-) which creates the buffer and calls [`copyLarge(InputStream, OutputStream, byte[])`](https://commons.apache.org/proper/commons-io/apidocs/org/apache/commons/io/IOUtils.html#copyLarge-java.io.InputStream-java.io.OutputStream-byte:A-).

Applications can re-use buffers by using the underlying methods directly. This may improve performance for applications that need to do a lot of copying.

Wherever possible, the methods in this class do *not* flush or close the stream. This is to avoid making non-portable assumptions about the streams' origin and further use. Thus the caller is still responsible for closing streams after use.

Origin of code: Excalibur.-   [java.lang.Object](https://docs.oracle.com/javase/7/docs/api/java/lang/Object.html?is-external=true "class or interface in java.lang")
-   org.apache.commons.io.FileUtils

-   * * * * *

    public class [FileUtils](https://commons.apache.org/proper/commons-io/apidocs/src-html/org/apache/commons/io/FileUtils.html#line.104)
    extends [Object](https://docs.oracle.com/javase/7/docs/api/java/lang/Object.html?is-external=true "class or interface in java.lang")

    General file manipulation utilities.

    Facilities are provided in the following areas:

    -   writing to a file
    -   reading from a file
    -   make a directory including parent directories
    -   copying files and directories
    -   deleting files and directories
    -   converting to and from a URL
    -   listing files and directories by filter and extension
    -   comparing file content
    -   file last changed date
    -   calculating a checksum

    Note that a specific charset should be specified whenever possible. Relying on the platform default means that the code is Locale-dependent. Only use the default if the files are known to always use the platform default.

    [`SecurityException`](https://docs.oracle.com/javase/7/docs/api/java/lang/SecurityException.html?is-external=true "class or interface in java.lang") are not documented in the Javadoc.

    Origin of code: Excalibur, Alexandria, Commons-Utils

[deleteDirectory](https://www.tabnine.com/code/java/methods/org.apache.commons.io.FileUtils/deleteDirectory)

[readFileToString](https://www.tabnine.com/code/java/methods/org.apache.commons.io.FileUtils/readFileToString)

[deleteQuietly](https://www.tabnine.com/code/java/methods/org.apache.commons.io.FileUtils/deleteQuietly)

[copyFile](https://www.tabnine.com/code/java/methods/org.apache.commons.io.FileUtils/copyFile)

[writeStringToFile](https://www.tabnine.com/code/java/methods/org.apache.commons.io.FileUtils/writeStringToFile)

[forceMkdir](https://www.tabnine.com/code/java/methods/org.apache.commons.io.FileUtils/forceMkdir)

[write](https://www.tabnine.com/code/java/methods/org.apache.commons.io.FileUtils/write)

[listFiles](https://www.tabnine.com/code/java/methods/org.apache.commons.io.FileUtils/listFiles)

[copyDirectory](https://www.tabnine.com/code/java/methods/org.apache.commons.io.FileUtils/copyDirectory)

[forceDelete](https://www.tabnine.com/code/java/methods/org.apache.commons.io.FileUtils/forceDelete)

# [org.apache.commons.lang3.StringUtils](https://commons.apache.org/proper/commons-lang/apidocs/org/apache/commons/lang3/StringUtils.html)

public class [StringUtils](https://commons.apache.org/proper/commons-lang/apidocs/src-html/org/apache/commons/lang3/StringUtils.html#line.123)
extends [Object](https://docs.oracle.com/javase/7/docs/api/java/lang/Object.html?is-external=true "class or interface in java.lang")

Operations on [`String`](https://docs.oracle.com/javase/7/docs/api/java/lang/String.html?is-external=true "class or interface in java.lang") that are `null` safe.

-   **IsEmpty/IsBlank** - checks if a String contains text
-   **Trim/Strip** - removes leading and trailing whitespace
-   **Equals/Compare** - compares two strings in a null-safe manner
-   **startsWith** - check if a String starts with a prefix in a null-safe manner
-   **endsWith** - check if a String ends with a suffix in a null-safe manner
-   **IndexOf/LastIndexOf/Contains** - null-safe index-of checks
-   **IndexOfAny/LastIndexOfAny/IndexOfAnyBut/LastIndexOfAnyBut** - index-of any of a set of Strings
-   **ContainsOnly/ContainsNone/ContainsAny** - checks if String contains only/none/any of these characters
-   **Substring/Left/Right/Mid** - null-safe substring extractions
-   **SubstringBefore/SubstringAfter/SubstringBetween** - substring extraction relative to other strings
-   **Split/Join** - splits a String into an array of substrings and vice versa
-   **Remove/Delete** - removes part of a String
-   **Replace/Overlay** - Searches a String and replaces one String with another
-   **Chomp/Chop** - removes the last part of a String
-   **AppendIfMissing** - appends a suffix to the end of the String if not present
-   **PrependIfMissing** - prepends a prefix to the start of the String if not present
-   **LeftPad/RightPad/Center/Repeat** - pads a String
-   **UpperCase/LowerCase/SwapCase/Capitalize/Uncapitalize** - changes the case of a String
-   **CountMatches** - counts the number of occurrences of one String in another
-   **IsAlpha/IsNumeric/IsWhitespace/IsAsciiPrintable** - checks the characters in a String
-   **DefaultString** - protects against a null input String
-   **Rotate** - rotate (circular shift) a String
-   **Reverse/ReverseDelimited** - reverses a String
-   **Abbreviate** - abbreviates a string using ellipses or another given String
-   **Difference** - compares Strings and reports on their differences
-   **LevenshteinDistance** - the number of changes needed to change one String into another

The `StringUtils` class defines certain words related to String handling.

-   null - `null`
-   empty - a zero-length string (`""`)
-   space - the space character (`' '`, char 32)
-   whitespace - the characters defined by [`Character.isWhitespace(char)`](https://docs.oracle.com/javase/7/docs/api/java/lang/Character.html?is-external=true#isWhitespace-char- "class or interface in java.lang")
-   trim - the characters <= 32 as in [`String.trim()`](https://docs.oracle.com/javase/7/docs/api/java/lang/String.html?is-external=true#trim-- "class or interface in java.lang")

`StringUtils` handles `null` input Strings quietly. That is to say that a `null` input will return `null`. Where a `boolean` or `int` is being returned details vary by method.

A side effect of the `null` handling is that a `NullPointerException` should be considered a bug in `StringUtils`.

Methods in this class include sample code in their Javadoc comments to explain their operation. The symbol `*` is used to indicate any input including `null`.

#ThreadSafe#

[isBlank](https://www.tabnine.com/code/java/methods/org.apache.commons.lang3.StringUtils/isBlank)

[isNotBlank](https://www.tabnine.com/code/java/methods/org.apache.commons.lang3.StringUtils/isNotBlank)

[isEmpty](https://www.tabnine.com/code/java/methods/org.apache.commons.lang3.StringUtils/isEmpty)

[isNotEmpty](https://www.tabnine.com/code/java/methods/org.apache.commons.lang3.StringUtils/isNotEmpty)

[equals](https://www.tabnine.com/code/java/methods/org.apache.commons.lang3.StringUtils/equals)

[join](https://www.tabnine.com/code/java/methods/org.apache.commons.lang3.StringUtils/join)

[split](https://www.tabnine.com/code/java/methods/org.apache.commons.lang3.StringUtils/split)

[trimToNull](https://www.tabnine.com/code/java/methods/org.apache.commons.lang3.StringUtils/trimToNull)

[replace](https://www.tabnine.com/code/java/methods/org.apache.commons.lang3.StringUtils/replace)

# [org.apache.http.util.EntityUtils](https://www.javadoc.io/doc/org.apache.httpcomponents/httpcore/latest/org/apache/http/util/EntityUtils.html)

public final class **EntityUtils**

extends [Object](https://docs.oracle.com/javase/6/docs/api/java/lang/Object.html?is-external=true "class or interface in java.lang")

Static helpers for dealing with [`HttpEntity`](https://www.javadoc.io/static/org.apache.httpcomponents/httpcore/4.4.15/org/apache/http/HttpEntity.html "interface in org.apache.http")s.

[toString](https://www.tabnine.com/code/java/methods/org.apache.http.util.EntityUtils/toString)

[consume](https://www.tabnine.com/code/java/methods/org.apache.http.util.EntityUtils/consume)

[toByteArray](https://www.tabnine.com/code/java/methods/org.apache.http.util.EntityUtils/toByteArray)

[consumeQuietly](https://www.tabnine.com/code/java/methods/org.apache.http.util.EntityUtils/consumeQuietly)

[getContentCharSet](https://www.tabnine.com/code/java/methods/org.apache.http.util.EntityUtils/getContentCharSet)

# [org.apache.commons.io.FilenameUtils](https://www.javadoc.io/doc/org.apache.httpcomponents/httpcore/latest/org/apache/http/util/EntityUtils.html)

public class [FilenameUtils](https://commons.apache.org/proper/commons-io/apidocs/src-html/org/apache/commons/io/FilenameUtils.html#line.87)
extends [Object](https://docs.oracle.com/javase/7/docs/api/java/lang/Object.html?is-external=true "class or interface in java.lang")

General file name and file path manipulation utilities.

When dealing with file names you can hit problems when moving from a Windows based development machine to a Unix based production machine. This class aims to help avoid those problems.

**NOTE**: You may be able to avoid using this class entirely simply by using JDK [`File`](https://docs.oracle.com/javase/7/docs/api/java/io/File.html?is-external=true "class or interface in java.io") objects and the two argument constructor [`File(File,String)`](https://docs.oracle.com/javase/7/docs/api/java/io/File.html?is-external=true#File-java.io.File-java.lang.String- "class or interface in java.io").

Most methods on this class are designed to work the same on both Unix and Windows. Those that don't include 'System', 'Unix' or 'Windows' in their name.

Most methods recognize both separators (forward and back), and both sets of prefixes. See the Javadoc of each method for details.

This class defines six components within a file name (example C:\dev\project\file.txt):

-   the prefix - C:\
-   the path - dev\project\
-   the full path - C:\dev\project\
-   the name - file.txt
-   the base name - file
-   the extension - txt

Note that this class works best if directory file names end with a separator. If you omit the last separator, it is impossible to determine if the file name corresponds to a file or a directory. As a result, we have chosen to say it corresponds to a file.

This class only supports Unix and Windows style names. Prefixes are matched as follows:

 Windows:
 a\b\c.txt           --> ""          --> relative
 \a\b\c.txt          --> "\"         --> current drive absolute
 C:a\b\c.txt         --> "C:"        --> drive relative
 C:\a\b\c.txt        --> "C:\"       --> absolute
 \\server\a\b\c.txt  --> "\\server\" --> UNC

 Unix:
 a/b/c.txt           --> ""          --> relative
 /a/b/c.txt          --> "/"         --> absolute
 ~/a/b/c.txt         --> "~/"        --> current user
 ~                   --> "~/"        --> current user (slash added)
 ~user/a/b/c.txt     --> "~user/"    --> named user
 ~user               --> "~user/"    --> named user (slash added)

Both prefix styles are matched always, irrespective of the machine that you are currently running on.

Origin of code: Excalibur, Alexandria, Tomcat, Commons-Utils.

[toString](https://www.tabnine.com/code/java/methods/org.apache.commons.io.FilenameUtils/toString)

[getExtension](https://www.tabnine.com/code/java/methods/org.apache.commons.io.FilenameUtils/getExtension)

[getBaseName](https://www.tabnine.com/code/java/methods/org.apache.commons.io.FilenameUtils/getBaseName)

[getName](https://www.tabnine.com/code/java/methods/org.apache.commons.io.FilenameUtils/getName)

[concat](https://www.tabnine.com/code/java/methods/org.apache.commons.io.FilenameUtils/concat)

[removeExtension](https://www.tabnine.com/code/java/methods/org.apache.commons.io.FilenameUtils/removeExtension)

[normalize](https://www.tabnine.com/code/java/methods/org.apache.commons.io.FilenameUtils/normalize)

[wildcardMatch](https://www.tabnine.com/code/java/methods/org.apache.commons.io.FilenameUtils/wildcardMatch)

[separatorsToUnix](https://www.tabnine.com/code/java/methods/org.apache.commons.io.FilenameUtils/separatorsToUnix)

[getFullPath](https://www.tabnine.com/code/java/methods/org.apache.commons.io.FilenameUtils/getFullPath)

[isExtension](https://www.tabnine.com/code/java/methods/org.apache.commons.io.FilenameUtils/isExtension)

# [org.springframework.util.StringUtils](https://docs.spring.io/spring-framework/docs/current/javadoc-api/org/springframework/util/StringUtils.html)

public abstract class StringUtils
extends [Object](https://docs.oracle.com/javase/8/docs/api/java/lang/Object.html?is-external=true "class or interface in java.lang")

Miscellaneous [`String`](https://docs.oracle.com/javase/8/docs/api/java/lang/String.html?is-external=true "class or interface in java.lang") utility methods.

Mainly for internal use within the framework; consider [Apache's Commons Lang](https://commons.apache.org/proper/commons-lang/) for a more comprehensive suite of `String` utilities.

This class delivers some simple functionality that should really be provided by the core Java [`String`](https://docs.oracle.com/javase/8/docs/api/java/lang/String.html?is-external=true "class or interface in java.lang") and [`StringBuilder`](https://docs.oracle.com/javase/8/docs/api/java/lang/StringBuilder.html?is-external=true "class or interface in java.lang") classes. It also provides easy-to-use methods to convert between delimited strings, such as CSV strings, and collections and arrays.

[hasText](https://www.tabnine.com/code/java/methods/org.springframework.util.StringUtils/hasText)

[hasLength](https://www.tabnine.com/code/java/methods/org.springframework.util.StringUtils/hasLength)

[isEmpty](https://www.tabnine.com/code/java/methods/org.springframework.util.StringUtils/isEmpty)

[commaDelimitedListToStringArray](https://www.tabnine.com/code/java/methods/org.springframework.util.StringUtils/commaDelimitedListToStringArray)

[collectionToDelimitedString](https://www.tabnine.com/code/java/methods/org.springframework.util.StringUtils/collectionToDelimitedString)

[replace](https://www.tabnine.com/code/java/methods/org.springframework.util.StringUtils/replace)

[delimitedListToStringArray](https://www.tabnine.com/code/java/methods/org.springframework.util.StringUtils/delimitedListToStringArray)

[uncapitalize](https://www.tabnine.com/code/java/methods/org.springframework.util.StringUtils/uncapitalize)

[collectionToCommaDelimitedString](https://www.tabnine.com/code/java/methods/org.springframework.util.StringUtils/collectionToCommaDelimitedString)

[tokenizeToStringArray](https://www.tabnine.com/code/java/methods/org.springframework.util.StringUtils/tokenizeToStringArray)

# [org.apache.commons.lang.ArrayUtils](https://commons.apache.org/proper/commons-lang/javadocs/api-release/org/apache/commons/lang3/ArrayUtils.html)

public class [ArrayUtils](https://commons.apache.org/proper/commons-lang/javadocs/api-release/src-html/org/apache/commons/lang3/ArrayUtils.html#line.49)
extends [Object](https://docs.oracle.com/javase/7/docs/api/java/lang/Object.html?is-external=true "class or interface in java.lang")

Operations on arrays, primitive arrays (like `int[]`) and primitive wrapper arrays (like `Integer[]`).

This class tries to handle `null` input gracefully. An exception will not be thrown for a `null` array input. However, an Object array that contains a `null` element may throw an exception. Each method documents its behavior.

#ThreadSafe#

[contains](https://www.tabnine.com/code/java/methods/org.apache.commons.lang.ArrayUtils/contains)

[addAll](https://www.tabnine.com/code/java/methods/org.apache.commons.lang.ArrayUtils/addAll)

[clone](https://www.tabnine.com/code/java/methods/org.apache.commons.lang.ArrayUtils/clone)

[isEmpty](https://www.tabnine.com/code/java/methods/org.apache.commons.lang.ArrayUtils/isEmpty)

[add](https://www.tabnine.com/code/java/methods/org.apache.commons.lang.ArrayUtils/add)

[subarray](https://www.tabnine.com/code/java/methods/org.apache.commons.lang.ArrayUtils/subarray)

[indexOf](https://www.tabnine.com/code/java/methods/org.apache.commons.lang.ArrayUtils/indexOf)

[isEquals](https://www.tabnine.com/code/java/methods/org.apache.commons.lang.ArrayUtils/isEquals)

[toObject](https://www.tabnine.com/code/java/methods/org.apache.commons.lang.ArrayUtils/toObject)

# [org.apache.commons.lang.StringEscapeUtils](https://commons.apache.org/proper/commons-text/javadocs/api-release/org/apache/commons/text/StringEscapeUtils.html)

public class StringEscapeUtils
extends [Object](https://docs.oracle.com/javase/7/docs/api/java/lang/Object.html?is-external=true "class or interface in java.lang")

Escapes and unescapes `String`s for Java, Java Script, HTML and XML.

#ThreadSafe#

This code has been adapted from Apache Commons Lang 3.5.

[unescapeHtml4](https://www.tabnine.com/code/java/methods/org.apache.commons.lang3.StringEscapeUtils/unescapeHtml4)

[escapeHtml4](https://www.tabnine.com/code/java/methods/org.apache.commons.lang3.StringEscapeUtils/escapeHtml4)

[escapeXml](https://www.tabnine.com/code/java/methods/org.apache.commons.lang3.StringEscapeUtils/escapeXml)

[unescapeXml](https://www.tabnine.com/code/java/methods/org.apache.commons.lang3.StringEscapeUtils/unescapeXml)

[escapeJava](https://www.tabnine.com/code/java/methods/org.apache.commons.lang3.StringEscapeUtils/escapeJava)

[escapeEcmaScript](https://www.tabnine.com/code/java/methods/org.apache.commons.lang3.StringEscapeUtils/escapeEcmaScript)

[unescapeJava](https://www.tabnine.com/code/java/methods/org.apache.commons.lang3.StringEscapeUtils/unescapeJava)

[escapeJson](https://www.tabnine.com/code/java/methods/org.apache.commons.lang3.StringEscapeUtils/escapeJson)

[escapeXml10](https://www.tabnine.com/code/java/methods/org.apache.commons.lang3.StringEscapeUtils/escapeXml10)

[escapeHtml](https://www.tabnine.com/code/java/methods/org.apache.commons.lang.StringEscapeUtils/escapeHtml)

[unescapeHtml](https://www.tabnine.com/code/java/methods/org.apache.commons.lang.StringEscapeUtils/unescapeHtml)

[escapeXml](https://www.tabnine.com/code/java/methods/org.apache.commons.lang.StringEscapeUtils/escapeXml)

[escapeSql](https://www.tabnine.com/code/java/methods/org.apache.commons.lang.StringEscapeUtils/escapeSql)

[unescapeJava](https://www.tabnine.com/code/java/methods/org.apache.commons.lang.StringEscapeUtils/unescapeJava)

[escapeJava](https://www.tabnine.com/code/java/methods/org.apache.commons.lang.StringEscapeUtils/escapeJava)

[escapeJavaScript](https://www.tabnine.com/code/java/methods/org.apache.commons.lang.StringEscapeUtils/escapeJavaScript)

[unescapeXml](https://www.tabnine.com/code/java/methods/org.apache.commons.lang.StringEscapeUtils/unescapeXml)

[unescapeJavaScript](https://www.tabnine.com/code/java/methods/org.apache.commons.lang.StringEscapeUtils/unescapeJavaScript)

# [org.apache.http.client.utils.URLEncodedUtils](https://www.javadoc.io/doc/org.apache.httpcomponents/httpclient/latest/org/apache/http/client/utils/URLEncodedUtils.html)

public class **URLEncodedUtils**

extends [Object](https://docs.oracle.com/javase/6/docs/api/java/lang/Object.html?is-external=true "class or interface in java.lang")

A collection of utilities for encoding URLs.

[format](https://www.tabnine.com/code/java/methods/org.apache.http.client.utils.URLEncodedUtils/format)

[parse](https://www.tabnine.com/code/java/methods/org.apache.http.client.utils.URLEncodedUtils/parse)

# [org.apache.commons.codec.digest.DigestUtils](https://commons.apache.org/proper/commons-codec/apidocs/org/apache/commons/codec/digest/DigestUtils.html)

public class DigestUtils
extends [Object](https://docs.oracle.com/javase/7/docs/api/java/lang/Object.html?is-external=true "class or interface in java.lang")

Operations to simplify common [`MessageDigest`](https://docs.oracle.com/javase/7/docs/api/java/security/MessageDigest.html?is-external=true "class or interface in java.security") tasks. This class is immutable and thread-safe. However the MessageDigest instances it creates generally won't be.

The [`MessageDigestAlgorithms`](https://commons.apache.org/proper/commons-codec/apidocs/org/apache/commons/codec/digest/MessageDigestAlgorithms.html "class in org.apache.commons.codec.digest") class provides constants for standard digest algorithms that can be used with the [`getDigest(String)`](https://commons.apache.org/proper/commons-codec/apidocs/org/apache/commons/codec/digest/DigestUtils.html#getDigest-java.lang.String-) method and other methods that require the Digest algorithm name.

Note: the class has short-hand methods for all the algorithms present as standard in Java 6. This approach requires lots of methods for each algorithm, and quickly becomes unwieldy. The following code works with all algorithms:

 import static org.apache.commons.codec.digest.MessageDigestAlgorithms.SHA_224;
 ...
 byte [] digest = new DigestUtils(SHA_224).digest(dataToDigest);
 String hdigest = new DigestUtils(SHA_224).digestAsHex(new File("pom.xml"));

See Also:

[`MessageDigestAlgorithms`](https://commons.apache.org/proper/commons-codec/apidocs/org/apache/commons/codec/digest/MessageDigestAlgorithms.html "class in org.apache.commons.codec.digest")

[md5Hex](https://www.tabnine.com/code/java/methods/org.apache.commons.codec.digest.DigestUtils/md5Hex)

[shaHex](https://www.tabnine.com/code/java/methods/org.apache.commons.codec.digest.DigestUtils/shaHex)

[sha256Hex](https://www.tabnine.com/code/java/methods/org.apache.commons.codec.digest.DigestUtils/sha256Hex)

[sha1Hex](https://www.tabnine.com/code/java/methods/org.apache.commons.codec.digest.DigestUtils/sha1Hex)

[sha](https://www.tabnine.com/code/java/methods/org.apache.commons.codec.digest.DigestUtils/sha)

[md5](https://www.tabnine.com/code/java/methods/org.apache.commons.codec.digest.DigestUtils/md5)

[sha512Hex](https://www.tabnine.com/code/java/methods/org.apache.commons.codec.digest.DigestUtils/sha512Hex)

[sha1](https://www.tabnine.com/code/java/methods/org.apache.commons.codec.digest.DigestUtils/sha1)

# [org.apache.commons.collections.CollectionUtils](https://commons.apache.org/proper/commons-collections/apidocs/org/apache/commons/collections4/CollectionUtils.html)

public class [CollectionUtils](https://commons.apache.org/proper/commons-collections/apidocs/src-html/org/apache/commons/collections4/CollectionUtils.html#line.56)
extends [Object](https://docs.oracle.com/javase/7/docs/api/java/lang/Object.html?is-external=true "class or interface in java.lang")

Provides utility methods and decorators for [`Collection`](https://docs.oracle.com/javase/7/docs/api/java/util/Collection.html?is-external=true "class or interface in java.util") instances.

Various utility methods might put the input objects into a Set/Map/Bag. In case the input objects override [`Object.equals(Object)`](https://docs.oracle.com/javase/7/docs/api/java/lang/Object.html?is-external=true#equals-java.lang.Object- "class or interface in java.lang"), it is mandatory that the general contract of the [`Object.hashCode()`](https://docs.oracle.com/javase/7/docs/api/java/lang/Object.html?is-external=true#hashCode-- "class or interface in java.lang") method is maintained.

NOTE: From 4.0, method parameters will take [`Iterable`](https://docs.oracle.com/javase/7/docs/api/java/lang/Iterable.html?is-external=true "class or interface in java.lang") objects when possible.

[isEmpty](https://www.tabnine.com/code/java/methods/org.apache.commons.collections.CollectionUtils/isEmpty)

[isNotEmpty](https://www.tabnine.com/code/java/methods/org.apache.commons.collections.CollectionUtils/isNotEmpty)

[select](https://www.tabnine.com/code/java/methods/org.apache.commons.collections.CollectionUtils/select)

[transform](https://www.tabnine.com/code/java/methods/org.apache.commons.collections.CollectionUtils/transform)

[filter](https://www.tabnine.com/code/java/methods/org.apache.commons.collections.CollectionUtils/filter)

[find](https://www.tabnine.com/code/java/methods/org.apache.commons.collections.CollectionUtils/find)

[collect](https://www.tabnine.com/code/java/methods/org.apache.commons.collections.CollectionUtils/collect)

[forAllDo](https://www.tabnine.com/code/java/methods/org.apache.commons.collections.CollectionUtils/forAllDo)

[addAll](https://www.tabnine.com/code/java/methods/org.apache.commons.collections.CollectionUtils/addAll)

[isEqualCollection](https://www.tabnine.com/code/java/methods/org.apache.commons.collections.CollectionUtils/isEqualCollection)

# [org.apache.commons.lang3.ArrayUtils](https://commons.apache.org/proper/commons-lang/apidocs/org/apache/commons/lang3/ArrayUtils.html)

public class [ArrayUtils](https://commons.apache.org/proper/commons-lang/apidocs/src-html/org/apache/commons/lang3/ArrayUtils.html#line.49)
extends [Object](https://docs.oracle.com/javase/7/docs/api/java/lang/Object.html?is-external=true "class or interface in java.lang")

Operations on arrays, primitive arrays (like `int[]`) and primitive wrapper arrays (like `Integer[]`).

This class tries to handle `null` input gracefully. An exception will not be thrown for a `null` array input. However, an Object array that contains a `null` element may throw an exception. Each method documents its behavior.

#ThreadSafe#

[contains](https://www.tabnine.com/code/java/methods/org.apache.commons.lang3.ArrayUtils/contains)

[isEmpty](https://www.tabnine.com/code/java/methods/org.apache.commons.lang3.ArrayUtils/isEmpty)

[isNotEmpty](https://www.tabnine.com/code/java/methods/org.apache.commons.lang3.ArrayUtils/isNotEmpty)

[add](https://www.tabnine.com/code/java/methods/org.apache.commons.lang3.ArrayUtils/add)

[clone](https://www.tabnine.com/code/java/methods/org.apache.commons.lang3.ArrayUtils/clone)

[addAll](https://www.tabnine.com/code/java/methods/org.apache.commons.lang3.ArrayUtils/addAll)

[subarray](https://www.tabnine.com/code/java/methods/org.apache.commons.lang3.ArrayUtils/subarray)

[indexOf](https://www.tabnine.com/code/java/methods/org.apache.commons.lang3.ArrayUtils/indexOf)

# [org.apache.commons.beanutils.PropertyUtils](https://commons.apache.org/proper/commons-beanutils/apidocs/org/apache/commons/beanutils/PropertyUtils.html)

public class [PropertyUtils](https://commons.apache.org/proper/commons-beanutils/apidocs/src-html/org/apache/commons/beanutils/PropertyUtils.html#line.41)
extends [Object](https://docs.oracle.com/javase/1.5.0/docs/api/java/lang/Object.html?is-external=true "class or interface in java.lang")

Utility methods for using Java Reflection APIs to facilitate generic property getter and setter operations on Java objects.

The implementations for these methods are provided by `PropertyUtilsBean`. For more details see [`PropertyUtilsBean`](https://commons.apache.org/proper/commons-beanutils/apidocs/org/apache/commons/beanutils/PropertyUtilsBean.html "class in org.apache.commons.beanutils").

Version:

$Id$

See Also:

[`PropertyUtilsBean`](https://commons.apache.org/proper/commons-beanutils/apidocs/org/apache/commons/beanutils/PropertyUtilsBean.html "class in org.apache.commons.beanutils"), [`Resolver`](https://commons.apache.org/proper/commons-beanutils/apidocs/org/apache/commons/beanutils/expression/Resolver.html "interface in org.apache.commons.beanutils.expression")

[getProperty](https://www.tabnine.com/code/java/methods/org.apache.commons.beanutils.PropertyUtils/getProperty)

[setProperty](https://www.tabnine.com/code/java/methods/org.apache.commons.beanutils.PropertyUtils/setProperty)

[getPropertyDescriptors](https://www.tabnine.com/code/java/methods/org.apache.commons.beanutils.PropertyUtils/getPropertyDescriptors)

[isReadable](https://www.tabnine.com/code/java/methods/org.apache.commons.beanutils.PropertyUtils/isReadable)

[copyProperties](https://www.tabnine.com/code/java/methods/org.apache.commons.beanutils.PropertyUtils/copyProperties)

[getPropertyDescriptor](https://www.tabnine.com/code/java/methods/org.apache.commons.beanutils.PropertyUtils/getPropertyDescriptor)

[getSimpleProperty](https://www.tabnine.com/code/java/methods/org.apache.commons.beanutils.PropertyUtils/getSimpleProperty)

[isWriteable](https://www.tabnine.com/code/java/methods/org.apache.commons.beanutils.PropertyUtils/isWriteable)

[setSimpleProperty](https://www.tabnine.com/code/java/methods/org.apache.commons.beanutils.PropertyUtils/setSimpleProperty)

[getPropertyType](https://www.tabnine.com/code/java/methods/org.apache.commons.beanutils.PropertyUtils/getPropertyType)

# [org.apache.commons.beanutils.BeanUtils](https://commons.apache.org/proper/commons-beanutils/apidocs/org/apache/commons/beanutils/BeanUtils.html)

public class [BeanUtils](https://commons.apache.org/proper/commons-beanutils/apidocs/src-html/org/apache/commons/beanutils/BeanUtils.html#line.37)
extends [Object](https://docs.oracle.com/javase/1.5.0/docs/api/java/lang/Object.html?is-external=true "class or interface in java.lang")

Utility methods for populating JavaBeans properties via reflection.

The implementations are provided by [`BeanUtilsBean`](https://commons.apache.org/proper/commons-beanutils/apidocs/org/apache/commons/beanutils/BeanUtilsBean.html "class in org.apache.commons.beanutils"). These static utility methods use the default instance. More sophisticated behaviour can be provided by using a `BeanUtilsBean` instance.

Version:

$Id$

See Also:

[`BeanUtilsBean`](https://commons.apache.org/proper/commons-beanutils/apidocs/org/apache/commons/beanutils/BeanUtilsBean.html "class in org.apache.commons.beanutils")

[copyProperties](https://www.tabnine.com/code/java/methods/org.apache.commons.beanutils.BeanUtils/copyProperties)

[getProperty](https://www.tabnine.com/code/java/methods/org.apache.commons.beanutils.BeanUtils/getProperty)

[setProperty](https://www.tabnine.com/code/java/methods/org.apache.commons.beanutils.BeanUtils/setProperty)

[describe](https://www.tabnine.com/code/java/methods/org.apache.commons.beanutils.BeanUtils/describe)

[populate](https://www.tabnine.com/code/java/methods/org.apache.commons.beanutils.BeanUtils/populate)

[copyProperty](https://www.tabnine.com/code/java/methods/org.apache.commons.beanutils.BeanUtils/copyProperty)

[cloneBean](https://www.tabnine.com/code/java/methods/org.apache.commons.beanutils.BeanUtils/cloneBean)
