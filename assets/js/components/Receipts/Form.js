import React, { useMemo } from "react";

import FormikCurrencyField from "../shared/form/FormikCurrencyField";
import FormikDateField from "../shared/form/FormikDateField";
import FormikSelectField from "../shared/form/FormikSelectField";
import FormikTextField from "../shared/form/FormikTextField";
import FormModel from "../shared/FormModel";

const PATH = "receipts";
const MODEL = "receipt";

const validate = (values) => {
  const errors = {};

  if (!values.name) errors.name = "Required";
  if (!values.date) errors.date = "Required";
  if (!values.value) errors.value = "Required";
  if (!values.account_id) errors.account_id = "Required";

  return errors;
};

function ReceiptForm({ data = {}, accounts, onCancel }) {
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
        date: data.date,
        value: data.value || 0,
        account_id: (data.account && data.account.id) || "",
      }}
      validate={validate}
      path={PATH}
      model={MODEL}
    >
      {(formik) => (
        <React.Fragment>
          <FormikTextField name="name" label="Name" formik={formik} />
          <FormikDateField name="date" label="Date" formik={formik} />
          <FormikCurrencyField name="value" label="Value" formik={formik} />
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

export default ReceiptForm;
