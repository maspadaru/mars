#ifndef SIMPLEAPP_SIMPLE_IO_MANAGER_H
#define SIMPLEAPP_SIMPLE_IO_MANAGER_H

#include <memory>
#include <vector>
#include <utility>

#include <core/io_manager.h>
#include <util/grounding.h>
#include <util/timeline.h>

#include "simple_parser.h"
#include "simple_reader.h"
#include "simple_writer.h"

class SimpleIOManager : public ares::core::IOManager {
  private:
    SimpleWriter simple_writer;
    SimpleReader simple_reader;
    SimpleParser simple_parser;
    std::string latest_output;
    bool is_output_enabled;

  public:
    explicit SimpleIOManager(std::string const &stream_path,
                  std::string const &output_path, bool is_output_enabled);

    ~SimpleIOManager() override = default;

    uint64_t read_stream_start_time() override;

    uint64_t read_stream_end_time() override;

    std::vector<std::shared_ptr<ares::util::Grounding>>
    read_stream_data(ares::util::Timeline &timeline) override;

    std::vector<std::shared_ptr<ares::util::Grounding>>
    read_background_data(ares::util::Timeline &timeline) override;

    void
    write_output_data(uint64_t time,
                      std::vector<std::shared_ptr<ares::util::Grounding>>
                          output_vector) override;

};

#endif // SIMPLEAPP_SIMPLE_IO_MANAGER_H
