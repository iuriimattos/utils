<?php

//include_once '../../config/config.temporario.php';

function mensagem($msg) {
    echo "<script>alert('" . str_replace("'", '"', $msg) . "');</script>";
}

function redireciona($url) {
    echo "<script>window.location = '" . $url . "';</script>";
}

function AbrirUrlOutraPagina($url) {
    echo "<script>window.location.open('" . $url . "');</script>";
}

/**
 *
 * @param type String (exemplo: 2014-02-14 14:55:00)
 * @return type String (exemplo: 15:25:00)
 */
function TransformaHHMMSSemSS() {
    //cortando a string 2014-02-14 14:55:00 para (HH:MM:SS)
    $hora_entrada_string = substr($value->hora_entrada, 11);
    //14:55:00

    //transformando (HH:MM:SS) em segundos
    $seconds = strtotime("1970-01-01 $hora_entrada_string UTC");
    //53700

    //acrescentando 1800 segundos = 30 minutos
    $seconds = $seconds + 1800;
    //55500

    //transformando segundos em (HH:MM:SS)
    $horafinal = gmdate("H:i:s", $seconds);
    //15:25:00
}

/**
 * @return type String (exemplo: Segunda-Feira, 19 de janeiro de 2015 - 15:53:01 )
 */
function RetornaDataAtualCompleta() {
    $hr = date("H:i:s", mktime(gmdate("H")-3, gmdate("i"), gmdate("s"), gmdate("m"), gmdate("d"), gmdate("Y")));
    $dia = date("d", mktime(gmdate("H")-3, gmdate("i"), gmdate("s"), gmdate("m"), gmdate("d"), gmdate("Y")));
    $mês = date("n", mktime(gmdate("H")-3, gmdate("i"), gmdate("s"), gmdate("m"), gmdate("d"), gmdate("Y")));
    $ano = date("Y", mktime(gmdate("H")-3, gmdate("i"), gmdate("s"), gmdate("m"), gmdate("d"), gmdate("Y")));
    $dia_sem = date("w", mktime(gmdate("H")-3, gmdate("i"), gmdate("s"), gmdate("m"), gmdate("d"), gmdate("Y")));
    $meses = array( 1=> "janeiro", "fevereiro", "março", "abril", "maio", "junho", "julho", "agosto", "setembro", "outubro", "novembro", "dezembro");
    $semanas = array("Domingo", "Segunda-Feira", "Terça-Feira", "Quarta-Feira", "Quinta-Feira", "Sexta-Feira", "Sábado");
    echo "$semanas[$dia_sem], $dia de $meses[$mês] de $ano - $hr";
}

/**
 *
 * @param type $anexo arry $_FILES
 * @param type $pasta caminho do arquivo
 * @return boolean
 */
function verificaArquivo($anexo, $pasta) {

    $ANEXO['pasta'] = $pasta;
    $ANEXO['tamanho'] = 1024 * 1024 * 10;
    $ANEXO['extensoes'] = array('pdf', 'png', 'jpg', 'jpeg', 'doc', 'docx', 'ppt', 'pptx', 'xls', 'xlsx');

    $ANEXO['renomeia'] = TRUE;

    $ANEXO['erros'][0] = 'Nao houve erro';
    $ANEXO['erros'][1] = 'O arquivo no upload';
    $ANEXO['erros'][2] = 'O arquivo ultrapassa o limite de tamanho';
    $ANEXO['erros'][3] = 'O upload feito parcialmente';
    $ANEXO['erros'][4] = 'Nao foi feito o upload do arquivo';

    if ($anexo['error']) {
        mensagem('Nao foi possivel fazer o upload, erro : ' . $ANEXO['erros'][$anexo['error']]);
    }
    //$verificaExtensao = strtolower(end(explode('.', $anexo['name'])));
    $explode = explode('.', $anexo['name']);
    $end = end($explode);
    $verificaExtensao = strtolower($end);

    if (array_search($verificaExtensao, $ANEXO['extensoes']) === FALSE) {
        echo 'Por favor, enviar arquivos com as seguintes extensoes: pdf, jpg, png, jpeg';
        return FALSE;
    }

    if ($ANEXO['tamanho'] < $anexo['size']) {
        mensagem('O arquivo é muito grande, envie arquivos de até 2Mb');
    }

    if ($ANEXO['renomeia'] == TRUE) {
        $rename = microtime(true) . md5($anexo['name']) . '.' . $verificaExtensao;
    } else {
        $rename = $anexo['name'];
    }

    if (!file_exists($ANEXO['pasta'])) {
        if (!mkdir($ANEXO['pasta'])) {
            mensagem("nao foi possivel criar a pasta!");
        }
    }

    if (move_uploaded_file($anexo['tmp_name'], $ANEXO['pasta'] . $rename)) {
        return $rename;
    } else {
        return FALSE;
    }
}

/**
 * @param type $pasta caminho do arquivo
 * @return string
 */
function deletaArquivo($pasta) {
    $filename = $pasta;
    $Message = '';
    if (file_exists($filename)) {
        if (!unlink($filename)) {
            $Message = "Error deleting $filename";
        } else {
            $Message = "Deleted $filename";
        }
    } else {
        $Message = "The file $filename does not exist";
    }
     return $Message;
}

function validarCNPJ($cnpj) {
    $cnpj = str_pad(str_replace(array('.', '-', '/'), '', $cnpj), 14, '0', STR_PAD_LEFT);
    if (strlen($cnpj) != 14) {
        return false;
    } else {
        for ($t = 12; $t < 14; $t++) {
            for ($d = 0, $p = $t - 7, $c = 0; $c < $t; $c++) {
                $d += $cnpj{$c} * $p;
                $p = ($p < 3) ? 9 : --$p;
            }
            $d = ((10 * $d) % 11) % 10;
            if ($cnpj{$c} != $d) {
                return false;
            }
        }
        return true;
    }
}

function validCPF($cpf) {
    // determina um valor inicial para o digito $d1 e $d2
    // pra manter o respeito ;)
    $d1 = 0;
    $d2 = 0;
    // remove tudo que não seja número
    $cpf = preg_replace("/[^0-9]/", "", $cpf);
    // lista de cpf inválidos que serão ignorados
    $ignore_list = array(
        '00000000000',
        '01234567890',
        '11111111111',
        '22222222222',
        '33333333333',
        '44444444444',
        '55555555555',
        '66666666666',
        '77777777777',
        '88888888888',
        '99999999999'
    );
    // se o tamanho da string for dirente de 11 ou estiver
    // na lista de cpf ignorados já retorna false
    if (strlen($cpf) != 11 || in_array($cpf, $ignore_list)) {
        return false;
    } else {
        // inicia o processo para achar o primeiro
        // número verificador usando os primeiros 9 dígitos
        for ($i = 0; $i < 9; $i++) {
            // inicialmente $d1 vale zero e é somando.
            // O loop passa por todos os 9 dígitos iniciais
            $d1 += $cpf[$i] * (10 - $i);
        }
        // acha o resto da divisão da soma acima por 11
        $r1 = $d1 % 11;
        // se $r1 maior que 1 retorna 11 menos $r1 se não
        // retona o valor zero para $d1
        $d1 = ($r1 > 1) ? (11 - $r1) : 0;
        // inicia o processo para achar o segundo
        // número verificador usando os primeiros 9 dígitos
        for ($i = 0; $i < 9; $i++) {
            // inicialmente $d2 vale zero e é somando.
            // O loop passa por todos os 9 dígitos iniciais
            $d2 += $cpf[$i] * (11 - $i);
        }
        // $r2 será o resto da soma do cpf mais $d1 vezes 2
        // dividido por 11
        $r2 = ($d2 + ($d1 * 2)) % 11;
        // se $r2 mair que 1 retorna 11 menos $r2 se não
        // retorna o valor zeroa para $d2
        $d2 = ($r2 > 1) ? (11 - $r2) : 0;
        // retona true se os dois últimos dígitos do cpf
        // forem igual a concatenação de $d1 e $d2 e se não
        // deve retornar false.
        return (substr($cpf, -2) == $d1 . $d2) ? true : false;
    }
}

function RemoveMaskCPF($cpf) {
    $replace1 = array(".", "-");
    $replace2 = array("", "");
    return $cpf = str_replace($replace1, $replace2, $cpf);
}


function logado() {
    session_start();
    if (!isset($_SESSION['usuario'])) {
        return FALSE;
    } else if (isset($_SESSION['usuario'])) {
        return TRUE;
    }
}

//Buscar um caracter específico em uma string e substitui-lo por outro
function trocaCaracter($caracter1, $caracter2, $texto) {
    //$texto = ‘oi-eu-sou-um-texto';
    $texto = str_replace('0$caracter1', '$caracter2', '$texto');
    //$texto = oi eu sou um texto
    return $resultado;
}

//Fazer uma comparação If/Else em uma linha
function Se($var1, $var2) {
    return $var1 > $var2 ? true : false;
}

//Obter a URL da página em que se está
function urlAtual() {
    return $_SERVER[‘HTTP_HOST’];
}

//Redirecionamento de endereço
function redirecionarPara($url) {
    header('Location: $url');
}

//Detectar o navegador do usuário
function detectarNavegador() {
    return $_SERVER[‘HTTP_USER_AGENT’];
}

//Validação de e-mail
function validarEmail($email) {
    if(!preg_match(“/^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+.[a-zA-Z0-9-.]+$/”,$email)) {
        return false;
    } else {
        return true;
    }
}

//Enviar e-mail (editar headers)
function enviarEmail($destino, $assunto, $corpo) {
<?php
echo 'hello world';
header('Access-Control-Allow-Origin: *');
$to      = 'iuriimattos@gmail.com';
$subject = 'CONTATO MEU SITE';

$message = '
<html>
    <head>
        <title></title>
    </head>
    <body>
        <table cellspacing="0" cellpadding="0" style="width:100%;border-bottom:1px solid #eee;font-size:12px;line-height:135%;font-family:Helvetica,Arial, sans-serif">
            <tr style="background-color:#F5F5F5">
                <th style="vertical-align:top;color:#222;text-align:left;padding:7px 9px 7px 9px;border-top:1px solid #eee;">
                    <span>Nome: </span>
                </th>
                <td style="vertical-align:top;color:#333;width:60%;padding:7px 9px 7px 0;border-top:1px solid #eee;">
                    <div>' . $_POST['name'] . '</div>
                </td>
            </tr>
            <tr style="background-color:#FFFFFF">
                <th style="vertical-align:top;color:#222;text-align:left;padding:7px 9px 7px 9px;border-top:1px solid #eee;">
                    <span>E-mail para contato: </span>
                </th>
                <td style="vertical-align:top;color:#333;width:60%;padding:7px 9px 7px 0;border-top:1px solid #eee;">
                    <div>'. $_POST['email'] . '</div>
                </td>
            </tr>
            <tr style="background-color:#F5F5F5">
                <th style="vertical-align:top;color:#222;text-align:left;padding:7px 9px 7px 9px;border-top:1px solid #eee;">
                    <span>Telefone: </span>
                </th>
                <td style="vertical-align:top;color:#333;width:60%;padding:7px 9px 7px 0;border-top:1px solid #eee;">
                    <div>'. $_POST['phone'] . '</div>
                </td>
            </tr>
            <tr style="background-color:#FFFFFF">
                <th style="vertical-align:top;color:#222;text-align:left;padding:7px 9px 7px 9px;border-top:1px solid #eee;">
                    <span>Mensagem: </span>
                </th>
                <td style="vertical-align:top;color:#333;width:60%;padding:7px 9px 7px 0;border-top:1px solid #eee;">
                    <div>'. nl2br($_POST['message']) . '</div>
                </td>
            </tr>
        </table>
    </body>
</html>
';

$headers = 'From: webmaster@iurimatos.com' . "\r\n" .
    'Reply-To: webmaster@iurimatos.com' . "\r\n" .
    'X-Mailer: PHP/' . phpversion();


$msg = mail($to, $subject, $message, $headers);

echo $msg ? 'Email enviado com sucesso' : 'Problemas ao enviar o email';
}

//Obter o IP do usuário. Essa função não funciona localmente.
function retornaIP() {
 return $_SERVER[‘REMOTE_ADDR’];
}

//Contar quantos caracteres ou palavras há em uma string
function contaCaracter($texto) {
    return strlen($text);
}

//Conta quantas palavras há em um texto
function contaPalavras($texto) {
    return str_word_count($str2);
}

/**
 * credits:
 * http://stackoverflow.com/questions/10152894/php-replacing-special-characters-like-%C3%A0-a-%C3%A8-e
 *
 * usar junto ao curl
 *
 * @param type String (exemplo: página)
 * @return type String (exemplo: pagina)
 **/
function checarLetras($field){
    return iconv('UTF-8', 'ISO-8859-1//TRANSLIT//IGNORE', $_POST['produto']);
}

/**
 * credits:
 * http://stackoverflow.com/questions/3371697/replacing-accented-characters-php
 *
 * Converts all accent characters to ASCII characters.
 *
 * If there are no accent characters, then the string given is just returned.
 *
 * @param string $string Text that might have accent characters
 * @return string Filtered string with replaced "nice" characters.
 */

function remove_accents($string) {
 if (!preg_match('/[\x80-\xff]/', $string))
  return $string;
 if (seems_utf8($string)) {
  $chars = array(
  // Decompositions for Latin-1 Supplement
  chr(195).chr(128) => 'A', chr(195).chr(129) => 'A',
  chr(195).chr(130) => 'A', chr(195).chr(131) => 'A',
  chr(195).chr(132) => 'A', chr(195).chr(133) => 'A',
  chr(195).chr(135) => 'C', chr(195).chr(136) => 'E',
  chr(195).chr(137) => 'E', chr(195).chr(138) => 'E',
  chr(195).chr(139) => 'E', chr(195).chr(140) => 'I',
  chr(195).chr(141) => 'I', chr(195).chr(142) => 'I',
  chr(195).chr(143) => 'I', chr(195).chr(145) => 'N',
  chr(195).chr(146) => 'O', chr(195).chr(147) => 'O',
  chr(195).chr(148) => 'O', chr(195).chr(149) => 'O',
  chr(195).chr(150) => 'O', chr(195).chr(153) => 'U',
  chr(195).chr(154) => 'U', chr(195).chr(155) => 'U',
  chr(195).chr(156) => 'U', chr(195).chr(157) => 'Y',
  chr(195).chr(159) => 's', chr(195).chr(160) => 'a',
  chr(195).chr(161) => 'a', chr(195).chr(162) => 'a',
  chr(195).chr(163) => 'a', chr(195).chr(164) => 'a',
  chr(195).chr(165) => 'a', chr(195).chr(167) => 'c',
  chr(195).chr(168) => 'e', chr(195).chr(169) => 'e',
  chr(195).chr(170) => 'e', chr(195).chr(171) => 'e',
  chr(195).chr(172) => 'i', chr(195).chr(173) => 'i',
  chr(195).chr(174) => 'i', chr(195).chr(175) => 'i',
  chr(195).chr(177) => 'n', chr(195).chr(178) => 'o',
  chr(195).chr(179) => 'o', chr(195).chr(180) => 'o',
  chr(195).chr(181) => 'o', chr(195).chr(182) => 'o',
  chr(195).chr(182) => 'o', chr(195).chr(185) => 'u',
  chr(195).chr(186) => 'u', chr(195).chr(187) => 'u',
  chr(195).chr(188) => 'u', chr(195).chr(189) => 'y',
  chr(195).chr(191) => 'y',
  // Decompositions for Latin Extended-A
  chr(196).chr(128) => 'A', chr(196).chr(129) => 'a',
  chr(196).chr(130) => 'A', chr(196).chr(131) => 'a',
  chr(196).chr(132) => 'A', chr(196).chr(133) => 'a',
  chr(196).chr(134) => 'C', chr(196).chr(135) => 'c',
  chr(196).chr(136) => 'C', chr(196).chr(137) => 'c',
  chr(196).chr(138) => 'C', chr(196).chr(139) => 'c',
  chr(196).chr(140) => 'C', chr(196).chr(141) => 'c',
  chr(196).chr(142) => 'D', chr(196).chr(143) => 'd',
  chr(196).chr(144) => 'D', chr(196).chr(145) => 'd',
  chr(196).chr(146) => 'E', chr(196).chr(147) => 'e',
  chr(196).chr(148) => 'E', chr(196).chr(149) => 'e',
  chr(196).chr(150) => 'E', chr(196).chr(151) => 'e',
  chr(196).chr(152) => 'E', chr(196).chr(153) => 'e',
  chr(196).chr(154) => 'E', chr(196).chr(155) => 'e',
  chr(196).chr(156) => 'G', chr(196).chr(157) => 'g',
  chr(196).chr(158) => 'G', chr(196).chr(159) => 'g',
  chr(196).chr(160) => 'G', chr(196).chr(161) => 'g',
  chr(196).chr(162) => 'G', chr(196).chr(163) => 'g',
  chr(196).chr(164) => 'H', chr(196).chr(165) => 'h',
  chr(196).chr(166) => 'H', chr(196).chr(167) => 'h',
  chr(196).chr(168) => 'I', chr(196).chr(169) => 'i',
  chr(196).chr(170) => 'I', chr(196).chr(171) => 'i',
  chr(196).chr(172) => 'I', chr(196).chr(173) => 'i',
  chr(196).chr(174) => 'I', chr(196).chr(175) => 'i',
  chr(196).chr(176) => 'I', chr(196).chr(177) => 'i',
  chr(196).chr(178) => 'IJ',chr(196).chr(179) => 'ij',
  chr(196).chr(180) => 'J', chr(196).chr(181) => 'j',
  chr(196).chr(182) => 'K', chr(196).chr(183) => 'k',
  chr(196).chr(184) => 'k', chr(196).chr(185) => 'L',
  chr(196).chr(186) => 'l', chr(196).chr(187) => 'L',
  chr(196).chr(188) => 'l', chr(196).chr(189) => 'L',
  chr(196).chr(190) => 'l', chr(196).chr(191) => 'L',
  chr(197).chr(128) => 'l', chr(197).chr(129) => 'L',
  chr(197).chr(130) => 'l', chr(197).chr(131) => 'N',
  chr(197).chr(132) => 'n', chr(197).chr(133) => 'N',
  chr(197).chr(134) => 'n', chr(197).chr(135) => 'N',
  chr(197).chr(136) => 'n', chr(197).chr(137) => 'N',
  chr(197).chr(138) => 'n', chr(197).chr(139) => 'N',
  chr(197).chr(140) => 'O', chr(197).chr(141) => 'o',
  chr(197).chr(142) => 'O', chr(197).chr(143) => 'o',
  chr(197).chr(144) => 'O', chr(197).chr(145) => 'o',
  chr(197).chr(146) => 'OE',chr(197).chr(147) => 'oe',
  chr(197).chr(148) => 'R',chr(197).chr(149) => 'r',
  chr(197).chr(150) => 'R',chr(197).chr(151) => 'r',
  chr(197).chr(152) => 'R',chr(197).chr(153) => 'r',
  chr(197).chr(154) => 'S',chr(197).chr(155) => 's',
  chr(197).chr(156) => 'S',chr(197).chr(157) => 's',
  chr(197).chr(158) => 'S',chr(197).chr(159) => 's',
  chr(197).chr(160) => 'S', chr(197).chr(161) => 's',
  chr(197).chr(162) => 'T', chr(197).chr(163) => 't',
  chr(197).chr(164) => 'T', chr(197).chr(165) => 't',
  chr(197).chr(166) => 'T', chr(197).chr(167) => 't',
  chr(197).chr(168) => 'U', chr(197).chr(169) => 'u',
  chr(197).chr(170) => 'U', chr(197).chr(171) => 'u',
  chr(197).chr(172) => 'U', chr(197).chr(173) => 'u',
  chr(197).chr(174) => 'U', chr(197).chr(175) => 'u',
  chr(197).chr(176) => 'U', chr(197).chr(177) => 'u',
  chr(197).chr(178) => 'U', chr(197).chr(179) => 'u',
  chr(197).chr(180) => 'W', chr(197).chr(181) => 'w',
  chr(197).chr(182) => 'Y', chr(197).chr(183) => 'y',
  chr(197).chr(184) => 'Y', chr(197).chr(185) => 'Z',
  chr(197).chr(186) => 'z', chr(197).chr(187) => 'Z',
  chr(197).chr(188) => 'z', chr(197).chr(189) => 'Z',
  chr(197).chr(190) => 'z', chr(197).chr(191) => 's',
  // Euro Sign
  chr(226).chr(130).chr(172) => 'E',
  // GBP (Pound) Sign
  chr(194).chr(163) => '');
  $string = strtr($string, $chars);
 } else {
  // Assume ISO-8859-1 if not UTF-8
  $chars['in'] = chr(128).chr(131).chr(138).chr(142).chr(154).chr(158)
   .chr(159).chr(162).chr(165).chr(181).chr(192).chr(193).chr(194)
   .chr(195).chr(196).chr(197).chr(199).chr(200).chr(201).chr(202)
   .chr(203).chr(204).chr(205).chr(206).chr(207).chr(209).chr(210)
   .chr(211).chr(212).chr(213).chr(214).chr(216).chr(217).chr(218)
   .chr(219).chr(220).chr(221).chr(224).chr(225).chr(226).chr(227)
   .chr(228).chr(229).chr(231).chr(232).chr(233).chr(234).chr(235)
   .chr(236).chr(237).chr(238).chr(239).chr(241).chr(242).chr(243)
   .chr(244).chr(245).chr(246).chr(248).chr(249).chr(250).chr(251)
   .chr(252).chr(253).chr(255);
  $chars['out'] = "EfSZszYcYuAAAAAACEEEEIIIINOOOOOOUUUUYaaaaaaceeeeiiiinoooooouuuuyy";
  $string = strtr($string, $chars['in'], $chars['out']);
  $double_chars['in'] = array(chr(140), chr(156), chr(198), chr(208), chr(222), chr(223), chr(230), chr(240), chr(254));
  $double_chars['out'] = array('OE', 'oe', 'AE', 'DH', 'TH', 'ss', 'ae', 'dh', 'th');
  $string = str_replace($double_chars['in'], $double_chars['out'], $string);
 }
 return $string;
}

/**
 * credits:
 * http://stackoverflow.com/questions/3371697/replacing-accented-characters-php
 *
 * Checks to see if a string is utf8 encoded.
 *
 * @author bmorel at ssi dot fr
 *
 * @param string $Str The string to be checked
 * @return bool True if $Str fits a UTF-8 model, false otherwise.
 */
function seems_utf8($Str) { # by bmorel at ssi dot fr
 $length = strlen($Str);
 for ($i = 0; $i < $length; $i++) {
  if (ord($Str[$i]) < 0x80) continue; # 0bbbbbbb
  elseif ((ord($Str[$i]) & 0xE0) == 0xC0) $n = 1; # 110bbbbb
  elseif ((ord($Str[$i]) & 0xF0) == 0xE0) $n = 2; # 1110bbbb
  elseif ((ord($Str[$i]) & 0xF8) == 0xF0) $n = 3; # 11110bbb
  elseif ((ord($Str[$i]) & 0xFC) == 0xF8) $n = 4; # 111110bb
  elseif ((ord($Str[$i]) & 0xFE) == 0xFC) $n = 5; # 1111110b
  else return false; # Does not match any model
  for ($j = 0; $j < $n; $j++) { # n bytes matching 10bbbbbb follow ?
   if ((++$i == $length) || ((ord($Str[$i]) & 0xC0) != 0x80))
   return false;
  }
 }
 return true;
}

/**
 * credits:
 * http://stackoverflow.com/questions/3371697/replacing-accented-characters-php
 *
 */
function utf8_uri_encode($utf8_string, $length = 0) {
 $unicode = '';
 $values = array();
 $num_octets = 1;
 $unicode_length = 0;
 $string_length = strlen($utf8_string);
 for ($i = 0; $i < $string_length; $i++) {
  $value = ord($utf8_string[$i]);
  if ($value < 128) {
   if ($length && ($unicode_length >= $length))
    break;
   $unicode .= chr($value);
   $unicode_length++;
  } else {
   if (count($values) == 0) $num_octets = ($value < 224) ? 2 : 3;
   $values[] = $value;
   if ($length && ($unicode_length + ($num_octets * 3)) > $length)
    break;
   if (count( $values ) == $num_octets) {
    if ($num_octets == 3) {
     $unicode .= '%' . dechex($values[0]) . '%' . dechex($values[1]) . '%' . dechex($values[2]);
     $unicode_length += 9;
    } else {
     $unicode .= '%' . dechex($values[0]) . '%' . dechex($values[1]);
     $unicode_length += 6;
    }
    $values = array();
    $num_octets = 1;
   }
  }
 }
 return $unicode;
}

/**
 * credits:
 * http://stackoverflow.com/questions/3371697/replacing-accented-characters-php
 *
 * Sanitizes title, replacing whitespace with dashes.
 *
 * Limits the output to alphanumeric characters, underscore (_) and dash (-).
 * Whitespace becomes a dash.
 *
 * @param string $title The title to be sanitized.
 * @return string The sanitized title.
 */
function slugify($title) {
 $title = strip_tags($title);
 // Preserve escaped octets.
 $title = preg_replace('|%([a-fA-F0-9][a-fA-F0-9])|', '---$1---', $title);
 // Remove percent signs that are not part of an octet.
 $title = str_replace('%', '', $title);
 // Restore octets.
 $title = preg_replace('|---([a-fA-F0-9][a-fA-F0-9])---|', '%$1', $title);
 $title = remove_accents($title);
 if (seems_utf8($title)) {
  if (function_exists('mb_strtolower')) {
   $title = mb_strtolower($title, 'UTF-8');
  }
  $title = utf8_uri_encode($title, 200);
 }
 $title = strtolower($title);
 $title = preg_replace('/&.+?;/', '', $title); // kill entities
 $title = preg_replace('/[^%a-z0-9 _-]/', '', $title);
 $title = preg_replace('/\s+/', '-', $title);
 $title = preg_replace('|-+|', '-', $title);
 $title = trim($title, '-');
 return $title;
}

/**
 * debugOutput <pre>
 *
 *
 */
function debugOutput($variable) {
  echo '<pre style="display: none;">';
  print_r($variable);
  echo '</pre>';
}

/**
 * xdebug
 * ini
 * info
 */
function phpinfo() {
  phpinfo();
}

function phpmailerEXAMPLE() {
  ini_set('display_errors',1);
  ini_set('display_startup_erros',1);
  error_reporting(E_ALL);

  $name = $_POST['nome'];
  $email = $_POST['email'];
  $telefone = $_POST['telefone'];
  $assunto = $_POST['assunto'];
  $message = $_POST['mensagem'];
  $termos = $_POST['termos'];

  //$destinatario = "iuri@estudiozenit.com"; ////// TROCAR DESTINATARIO DO EMAIL/
  //$destinatario = "patriciaballar@carajas.net.br"; ////// TROCAR DESTINATARIO DO EMAIL/
  //$destinatario = "dashdanilo@estudiozenit.com"; ////// TROCAR DESTINATARIO DO EMAIL/
  //$headers = "MIME-Version: 1.0\n";
  //$headers .= 'From: Contato - '. $name .' <' . $email .'>' . "\r\n";
  //$headers .= "Content-Type: text/html; charset=\"UTF-8\"\n\n";
  $mensagem = '
  <html>
  <head>
      <title>Dona Valmira - ' .$assunto. '</title>
  </head>
  <body>
  <table cellspacing="0" cellpadding="0" style="width:100%;border-bottom:1px solid #eee;font-size:12px;line-height:135%;font-family:Helvetica,Arial, sans-serif">
      <tr style="background-color:#F5F5F5">
          <th style="vertical-align:top;color:#222;text-align:left;padding:7px 9px 7px 9px;border-top:1px solid #eee;">
              <span>Nome: </span>
          </th>
          <td style="vertical-align:top;color:#333;width:60%;padding:7px 9px 7px 0;border-top:1px solid #eee;">
              <div>' . $name . '</div>
          </td>
      </tr>
      <tr style="background-color:#FFFFFF">
          <th style="vertical-align:top;color:#222;text-align:left;padding:7px 9px 7px 9px;border-top:1px solid #eee;">
              <span>E-mail para contato: </span>
          </th>
          <td style="vertical-align:top;color:#333;width:60%;padding:7px 9px 7px 0;border-top:1px solid #eee;">
              <div>'. $email . '</div>
          </td>
      </tr>
      <tr style="background-color:#F5F5F5">
          <th style="vertical-align:top;color:#222;text-align:left;padding:7px 9px 7px 9px;border-top:1px solid #eee;">
              <span>Telefone: </span>
          </th>
          <td style="vertical-align:top;color:#333;width:60%;padding:7px 9px 7px 0;border-top:1px solid #eee;">
              <div>'. $telefone . '</div>
          </td>
      </tr>
      <tr style="background-color:#FFFFFF">
          <th style="vertical-align:top;color:#222;text-align:left;padding:7px 9px 7px 9px;border-top:1px solid #eee;">
              <span>Mensagem: </span>
          </th>
          <td style="vertical-align:top;color:#333;width:60%;padding:7px 9px 7px 0;border-top:1px solid #eee;">
              <div>'. nl2br($message) . '</div>
          </td>
      </tr>
      <tr style="background-color:#FFFFFF">
          <th style="vertical-align:top;color:#222;text-align:left;padding:7px 9px 7px 9px;border-top:1px solid #eee;">
              <span>Aceito receber e-mail e SMS: </span>
          </th>
          <td style="vertical-align:top;color:#333;width:60%;padding:7px 9px 7px 0;border-top:1px solid #eee;">
              <div>'. nl2br($termos) . '</div>
          </td>
      </tr>
  </table>
  </body>
  </html>
  ';


  if(isset($_POST['nome']) && isset($_POST['email']) && isset($_POST['telefone']) && isset($_POST['mensagem'])) {
      if ($_POST['nome'] != "" && $_POST['email'] != "" && $_POST['telefone'] != "" && $_POST['mensagem'] != "") {
          require('./class.phpmailer.php');
          $mail = new PHPMailer();

          //NÃO REMOVER
          $mail->SetFrom('faleconosco@donavalmira.com.br', 'Fale Conosco');
          //SE NÃO BUGA

          if($assunto == "QUERO FAZER UMA LISTA DE PRESENTES") {
              $mail->AddAddress('RONDENELLETENORIO@CARAJAS.NET.BR');
              $mail->AddAddress('LISTADEPRESENTES@DONAVALMIRA.COM.BR');
          }
          else if ($assunto == "QUERO RECEBER NOVIDADES E OFERTAS") {
              $mail->AddAddress('MARIAMAYARA@CARAJAS.NET.BR');
          }
          else if ($assunto == "VENDA PARA EMPRESAS") {
              $mail->AddAddress('PATRICIABALLAR@CARAJAS.NET.BR');
          }
          else if ($assunto == "OUTRO ASSUNTO") {
              $mail->AddAddress('PATRICIABALLAR@CARAJAS.NET.BR');
          }

          $mail->Subject = 'Dona Valmira - ' . $assunto;
          $mail->IsHTML(true);
          $mail->Body    = $mensagem;

          if (!$mail->Send()) {
              echo "Mailer Error: " . $mail->ErrorInfo;
              echo "0";
          }
          else {
              echo "1";
          }
      }
      else {
          echo '0';
      }
  }
  else {
      echo '0';
  }

}
