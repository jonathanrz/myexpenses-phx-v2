import React from "react";

import FormikTextField from "../shared/form/FormikTextField";
import FormModel from "../shared/FormModel";

const PATH = "categories";
const MODEL = "category";

const validate = (values) => {
  const errors = {};

  if (!values.name) errors.name = "Required";

  return errors;
};

function CategoryForm({ data = {}, onCancel }) {
  return (
    <FormModel
      data={data}
      onCancel={onCancel}
      initialValues={{
        name: data.name || "",
      }}
      validate={validate}
      path={PATH}
      model={MODEL}
    >
      {(formik) => (
        <React.Fragment>
          <FormikTextField name="name" label="Name" formik={formik} />
        </React.Fragment>
      )}
    </FormModel>
  );
}

export default CategoryForm;
