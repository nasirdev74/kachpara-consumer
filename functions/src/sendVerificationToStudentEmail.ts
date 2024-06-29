import * as functions from "firebase-functions";

export const sendVerificationToStudentEmail = functions.runWith({secrets: ["TEMPLATE_ID", "SENDGRID_API_KEY"]}).https.onCall(async (data, context) => {
  try {
    const sgMail = await import("@sendgrid/mail");
    sgMail.setApiKey(process.env.SENDGRID_API_KEY!);

    const msg = {
      to: data.email, // Change to your recipient
      from: "no-reply@kachpara.com", // Change to your verified sender
      templateId: process.env.TEMPLATE_ID!,
      dynamicTemplateData: {
        code: data.code,
      },
    };

    await sgMail.send(msg);
    functions.logger.info(`student verification sent to ${data.email}`);
    return {email: data.email, code: data.code};
  } catch (error: any) {
    functions.logger.error(error);
    throw new functions.https.HttpsError("aborted", error);
  }
});


// export const sendVerificationToStudentEmail = functions.runWith({ secrets: ["SENDGRID_API_KEY", "TEMPLATE_ID"] }).https.onRequest(async (req, res) => {
//   try {

//     console.log("##############################");
//     console.log(req);
//     console.log("#################################");
//     const sgMail = await import("@sendgrid/mail");
//     sgMail.setApiKey(process.env.SENDGRID_API_KEY ?? "");


//     const msg: MailDataRequired | MailDataRequired[] = {
//       to: req.body.email, // Change to your recipient
//       from: "no-reply@kachpara.com", // Change to your verified sender
//       templateId: process.env.TEMPLATE_ID!,
//       dynamicTemplateData: {
//         code: req.body.code,
//       },
//     };

//     await sgMail.send(msg);
//     functions.logger.info(`student verification sent to ${req.body.email}`);

//     res.send("finished");
//   } catch (error) {
//     functions.logger.error(error);
//     throw new functions.https.HttpsError("aborted", (error as Object).toString());
//   }
// });
