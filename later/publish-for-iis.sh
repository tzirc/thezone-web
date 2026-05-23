rm -rf ./publish/iis/*
dotnet publish src/JayBaldwin.AspNetCore/JayBaldwin.AspNetCore.csproj \
    -c Release \
    -o ./publish/iis/app

cp compose.prod.yml ./publish/iis/
cp restart.sh ./publish/iis/