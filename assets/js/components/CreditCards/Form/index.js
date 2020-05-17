import React from "react";
import { useFormik } from "formik";

import getCSRFToken from "../../../helpers/getCSRFToken";
import FormikTextField from "../../shared/form/FormikTextField";

const PATH = "credit_cards";

const validate = (values) => {
  const errors = {};

  if (!values.name) errors.name = "Required";

  return errors;
};

function CreditCardForm({ data = {} }) {
  const formik = useFormik({
    initialValues: {
      name: data.name || "",
    },
    validate,
    onSubmit: (values) => {
      const body = new FormData();

      for (var key in values) {
        body.append(`${PATH}[${key}]`, values[key]);
      }
      body.append("_csrf_token", getCSRFToken());

      const url = `/${PATH}${data.id && "/" + data.id}`;
      const method = data.id ? "PUT" : "POST";

      fetch(url, {
        method,
        body,
        redirect: "manual",
      }).then((response) => {
        if (response.redirected || response.type === "opaqueredirect") {
          window.location.href = response.url;
        }
      });
    },
  });

  return (
    <form onSubmit={formik.handleSubmit}>
      <FormikTextField name="name" label="Name" formik={formik} />
      <div className="mt-3">
        <button
          className="waves-effect waves-teal btn-flat"
          data-csrf={getCSRFToken()}
          data-method="get"
          data-to={`/${PATH}`}
        >
          Cancel
        </button>
        <button className="btn waves-effect waves-light" type="submit">
          Save
        </button>
      </div>
    </form>
  );
}

export default CreditCardForm;
