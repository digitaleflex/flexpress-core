# Script pour trouver un port disponible dans une plage donnée
param(
    [int]$StartPort = 9000,
    [int]$EndPort = 9010
)

function Test-PortAvailable {
    param([int]$Port)
    
    try {
        $listener = New-Object System.Net.Sockets.TcpListener([System.Net.IPAddress]::Any, $Port)
        $listener.Start()
        $listener.Stop()
        return $true
    }
    catch {
        return $false
    }
}

# Recherche du premier port disponible
$availablePort = $null
for ($port = $StartPort; $port -le $EndPort; $port++) {
    if (Test-PortAvailable -Port $port) {
        $availablePort = $port
        break
    }
}

if ($availablePort) {
    Write-Host "Port disponible trouvé : $availablePort"
    
    # Génération de mots de passe sécurisés
    $mysqlRootPassword = -join ((48..57) + (97..122) + (65..90) | Get-Random -Count 16 | % {[char]$_})
    $mysqlPassword = -join ((48..57) + (97..122) + (65..90) | Get-Random -Count 16 | % {[char]$_})
    
    # Création du contenu du fichier .env
    $envContent = @"
# Configuration MySQL
MYSQL_ROOT_PASSWORD=$mysqlRootPassword
MYSQL_DATABASE=wordpress
MYSQL_USER=wordpress
MYSQL_PASSWORD=$mysqlPassword

# Configuration WordPress
WORDPRESS_DB_PASSWORD=$mysqlPassword
WORDPRESS_DEBUG=false


# Configuration Nginx
NGINX_PORT=$availablePort
NGINX_SSL_PORT=443
"@

    # Écriture du fichier .env
    $envContent | Out-File -FilePath ".env" -Encoding UTF8
    Write-Host "Fichier .env créé avec le port $availablePort"
    Write-Host "Mots de passe générés et sauvegardés dans le fichier .env"
}
else {
    Write-Host "Aucun port disponible trouvé dans la plage $StartPort-$EndPort"
    exit 1
} 