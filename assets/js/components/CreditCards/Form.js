import React, { useMemo } from "react";

import FormikTextField from "../shared/form/FormikTextField";
import FormikSelectField from "../shared/form/FormikSelectField";
import FormModel from "../shared/FormModel";

const PATH = "credit_cards";
const MODEL = "credit_card";

const validate = (values) => {
  const errors = {};

  if (!values.name) errors.name = "Required";

  return errors;
};

function CreditCardForm({ data = {}, accounts, onCancel }) {
  const options = useMemo(
    () =>
      accounts.map((account) => ({ value: account.id, label: account.name })),
    [accounts]
  );
  return (
    <FormModel
      data={data}
      onCancel={onCancel}
      initialValues={{
        name: data.name || "",
        account_id: (data.account && data.account.id) || "",
      }}
      validate={validate}
      path={PATH}
      model={MODEL}
    >
      {(formik) => (
        <React.Fragment>
          <FormikTextField name="name" label="Name" formik={formik} />
          <FormikSelectField
            name="account_id"
            label="Account"
            options={options}
            formik={formik}
          />
        </React.Fragment>
      )}
    </FormModel>
  );
}

export default CreditCardForm;
