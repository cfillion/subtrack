# Subtrack

## Installation

```sh
$ gem install subtrack
```

## Usage

### Switch to a task

The `planning` sub-task is stopped when switching to `programming`.
`software` is not stopped.

```sh
$ subtrack software
$ subtrack software/planning
$ subtrack software/programming
$ subtrack software/programming/refactoring
```

### Start tasks

`breathing` is not interrupted by `thinking`.

```sh
$ subtrack start life/breathing
$ subtrack start life/thinking
```

### Stop tasks

```sh
$ subtrack stop software
$ subtrack stop
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/cfillion/subtrack.
