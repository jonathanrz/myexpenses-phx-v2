import React from "react";
import { makeStyles } from "@material-ui/core/styles";
import Alert from "@material-ui/lab/Alert";
import FormControl from "@material-ui/core/FormControl";
import InputLabel from "@material-ui/core/InputLabel";
import Select from "@material-ui/core/Select";
import MenuItem from "@material-ui/core/MenuItem";

const useStyles = makeStyles(() => ({
  formControl: {
    width: "100%",
  },
}));

function FormikSelectField({ name, label, options, formik, ...props }) {
  const classes = useStyles();
  const hasError = Boolean(formik.touched[name] && formik.errors[name]);

  return (
    <FormControl className={classes.formControl}>
      <InputLabel id={`${name}_label`}>{label}</InputLabel>
      <Select
        id={name}
        labelId={`${name}_label`}
        onChange={(e) => {
          // we need to manually update the event with the field name
          e.target.name = name;
          formik.handleChange(e);
        }}
        value={formik.values[name]}
        error={hasError}
        {...props}
      >
        {options.map((option) => (
          <MenuItem key={option.value} value={option.value}>
            {option.label}
          </MenuItem>
        ))}
      </Select>
      {hasError ? <Alert severity="error">{formik.errors[name]}</Alert> : null}
    </FormControl>
  );
}

export default React.memo(FormikSelectField);
