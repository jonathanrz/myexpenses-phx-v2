import React from "react";

import FormikTextField from "../shared/form/FormikTextField";
import FormModel from "../shared/FormModel";

const PATH = "places";
const MODEL = "place";

const validate = (values) => {
  const errors = {};

  if (!values.name) errors.name = "Required";

  return errors;
};

function PlaceForm({ data = {}, onCancel }) {
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

export default PlaceForm;
