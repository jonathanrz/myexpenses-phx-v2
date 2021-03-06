import React from "react";
import Alert from "@material-ui/lab/Alert";
import TextField from "@material-ui/core/TextField";

function FormikTextField({ name, label, formik, ...props }) {
  const hasError = Boolean(formik.touched[name] && formik.errors[name]);
  return (
    <div>
      <TextField
        id={name}
        label={label}
        onChange={formik.handleChange}
        value={formik.values[name]}
        error={hasError}
        {...props}
      />
      {hasError ? <Alert severity="error">{formik.errors[name]}</Alert> : null}
    </div>
  );
}

export default React.memo(FormikTextField);
