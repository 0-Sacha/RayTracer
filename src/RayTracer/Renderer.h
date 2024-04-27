#pragma once

#include <memory>
#include "Walnut/Image.h"
#include "glm/glm.hpp"

class Renderer
{
public:
    Renderer() = default;

    void Render();
    void OnResize(uint32_t width, uint32_t height);

    std::shared_ptr<Walnut::Image> GetFinalImage() { return m_FinalImage; }

private:
    glm::vec4 PerPixel(glm::vec2 coord);

private:
    std::shared_ptr<Walnut::Image> m_FinalImage;
    std::unique_ptr<uint32_t[]> m_ImageData;

    float m_LastRenderTime;
};
