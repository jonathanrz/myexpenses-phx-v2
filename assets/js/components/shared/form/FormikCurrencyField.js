import React from "react";
import Alert from "@material-ui/lab/Alert";
import FormControl from "@material-ui/core/FormControl";
import Input from "@material-ui/core/Input";
import InputLabel from "@material-ui/core/InputLabel";
import Currency from "../../../helpers/currency";

function FormikTextField({ name, label, formik, ...props }) {
  const hasError = Boolean(formik.touched[name] && formik.errors[name]);

  return (
    <FormControl error={hasError}>
      <InputLabel htmlFor={name}>{label}</InputLabel>
      <Input
        id={name}
        value={Currency.format(formik.values[name])}
        onChange={(e) => {
          e.target.value = Currency.parse(e.target.value);
          formik.handleChange(e);
        }}
        {...props}
      />
      {hasError ? <Alert severity="error">{formik.errors[name]}</Alert> : null}
    </FormControl>
  );
}

export default React.memo(FormikTextField);
