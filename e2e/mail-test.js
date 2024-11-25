const nodemailer = require("nodemailer");

(async () => {
  const transporter = nodemailer.createTransport(
    {
      host: "localhost",
      port: 2525, // 465, 25, 587
      secure: false, // upgrade later with STARTTLS
      auth: {
        user: "user@domainusername",
        pass: "password",
      },
    },
    {
      from: `Me <me@sender.com>`,
    }
  );

  await transporter.sendMail({
    to: "hello@destination.com",
    subject: "test",
    html: "this is a body",
  });
})();
