import React from "react";

import FormikTextField from "../shared/form/FormikTextField";
import FormikCurrencyField from "../shared/form/FormikCurrencyField";
import FormModel from "../shared/FormModel";

const PATH = "accounts";
const MODEL = "account";

const validate = (values) => {
  const errors = {};

  if (!values.name) errors.name = "Required";
  if (!values.balance) errors.balance = "Required";

  return errors;
};

function AccountForm({ data = {}, onCancel }) {
  return (
    <FormModel
      data={data}
      onCancel={onCancel}
      initialValues={{
        name: data.name || "",
        balance: data.balance || 0,
      }}
      validate={validate}
      path={PATH}
      model={MODEL}
    >
      {(formik) => (
        <React.Fragment>
          <FormikTextField name="name" label="Name" formik={formik} />
          <FormikCurrencyField name="balance" label="Balance" formik={formik} />
        </React.Fragment>
      )}
    </FormModel>
  );
}

export default AccountForm;
