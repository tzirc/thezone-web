rm -rf ./publish/linux-x64/*
dotnet publish src/JayBaldwin.AspNetCore/JayBaldwin.AspNetCore.csproj \
  -c Release \
  -r linux-x64 \
  --self-contained true \
  -o ./publish/linux-x64/app

cp compose.prod.yml ./publish/linux-x64/
cp restart.sh ./publish/linux-x64/
