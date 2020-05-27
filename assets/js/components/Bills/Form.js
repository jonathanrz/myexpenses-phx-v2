import React from "react";

import FormikCurrencyField from "../shared/form/FormikCurrencyField";
import FormikDateField from "../shared/form/FormikDateField";
import FormikNumberField from "../shared/form/FormikNumberField";
import FormikTextField from "../shared/form/FormikTextField";
import FormModel from "../shared/FormModel";

const PATH = "bills";
const MODEL = "bill";

const validate = (values) => {
  const errors = {};

  if (!values.name) errors.name = "Required";
  if (!values.init_date) errors.init_date = "Required";
  if (!values.end_date) errors.end_date = "Required";
  if (!values.value) errors.value = "Required";
  if (!values.due_day) errors.due_day = "Required";

  return errors;
};

function BillForm({ data = {}, onCancel }) {
  return (
    <FormModel
      data={data}
      onCancel={onCancel}
      initialValues={{
        name: data.name || "",
        init_date: data.init_date,
        end_date: data.end_date,
        value: data.value || 0,
        due_day: data.due_day || 0,
      }}
      validate={validate}
      path={PATH}
      model={MODEL}
    >
      {(formik) => (
        <React.Fragment>
          <FormikTextField name="name" label="Name" formik={formik} />
          <FormikDateField name="init_date" label="Init Date" formik={formik} />
          <FormikDateField name="end_date" label="End Date" formik={formik} />
          <FormikCurrencyField name="value" label="Value" formik={formik} />
          <FormikNumberField name="due_day" label="Due Day" formik={formik} />
        </React.Fragment>
      )}
    </FormModel>
  );
}

export default BillForm;
