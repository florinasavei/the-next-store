import classNames from "classnames";
import { Controller, useForm } from "react-hook-form";

export const ContactPage = () => {

  const { control, handleSubmit } = useForm();


  const onSubmit = (data: any) => {
    console.log(data);
  };

  return (
    <div>
      <form onSubmit={handleSubmit(onSubmit)}>
        <Controller
          name="name"
          control={control}
          defaultValue=""
          render={({ field }) => (
            <input
              type="text"
              className={classNames(
                'border',
                'border-gray-400',
                'rounded',
                'w-full',
                'py-2',
                'px-3',
                'mt-2',
                'mb-4'
              )}
              placeholder="Name"
              {...field}
            />
          )}
        />
        <Controller
          name="email"
          control={control}
          defaultValue=""
          render={({ field }) => (
            <input
              type="email"
              className={classNames(
                'border',
                'border-gray-400',
                'rounded',
                'w-full',
                'py-2',
                'px-3',
                'mt-2',
                'mb-4'
              )}
              placeholder="Email"
              {...field}
            />
          )}
        />
        <Controller
          name="phone"
          control={control}
          defaultValue=""
          render={({ field }) => (
            <input
              className={classNames(
                'border',
                'border-gray-400',
                'rounded',
                'w-full',
                'py-2',
                'px-3',
                'mt-2',
                'mb-4'
              )}
              placeholder="Phone"
              {...field}
            />
          )}
        />
        <Controller
          name="message"
          control={control}
          defaultValue=""
          render={({ field }) => (
            <textarea
              className={classNames(
                'border',
                'border-gray-400',
                'rounded',
                'w-full',
                'py-2',
                'px-3',
                'mt-2',
                'mb-4'
              )}
              rows={5}
              placeholder="Message"
              {...field}
            />
          )}
        />
        <button
          type="submit"
          className={classNames(
            'bg-blue-500',
            'hover:bg-blue-700',
            'text-white',
            'py-2',
            'px-4',
            'rounded'
          )}
        >
          Submit
        </button>
      </form>
    </div>
  )
}
