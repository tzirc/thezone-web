module.exports = {
  public: true,
  host: "0.0.0.0",
  port: 9000,
  defaults: {
    name: "#TheZone",
    host: "irc.tzirc.com",
    port: 6697,
    tls: true,
    rejectUnauthorized: true,
    nick: "ZoneGuest%%",
    username: "zoneguest",
    realname: "#TheZone Webchat",
    join: "#thezone"
  },
  lockNetwork: true,
  prefetch: false,
  fileUpload: {
    enable: false
  }
};