import React from "react";
import { useFormik } from "formik";

import getCSRFToken from "../../../helpers/getCSRFToken";

function AccountForm() {
  const formik = useFormik({
    initialValues: {
      name: "",
      balance: 0,
    },
    onSubmit: (values) => {
      const body = new FormData();

      for (var key in values) {
        body.append(`account[${key}]`, values[key]);
      }
      body.append("_csrf_token", getCSRFToken());
      fetch("/accounts", {
        method: "POST",
        body,
      }).then((response) => {
        if (response.redirected) {
          window.location.href = response.url;
        }
      });
    },
  });

  console.log({ formik });

  return (
    <form onSubmit={formik.handleSubmit}>
      <div className="input-field mb-2">
        <label htmlFor="name">Name</label>
        <input
          id="name"
          name="name"
          type="text"
          onChange={formik.handleChange}
          value={formik.values.name}
        />
      </div>
      <div className="input-field mb-2">
        <label htmlFor="balance">Balance</label>
        <input
          id="balance"
          name="balance"
          type="number"
          onChange={formik.handleChange}
          value={formik.values.balance}
        />
      </div>
      <div className="right">
        <button
          className="waves-effect waves-teal btn-flat"
          data-csrf={getCSRFToken()}
          data-method="get"
          data-to="/accounts"
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

export default AccountForm;
